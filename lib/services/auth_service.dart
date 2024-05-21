import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application/screens/dashboard.dart';
import 'package:flutter_application/screens/login_screen.dart';
import 'package:flutter_application/services/db.dart';
import 'package:google_sign_in/google_sign_in.dart';

//ignore_for_file: prefer_const_constructors

class AuthService {
  var db = Db();

  createUser(data, context) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: data['email'],
        password: data['password'],
      );
      await db.addUser(data, context);
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: ((context) => Dashboard()))
      );
    } catch (e) {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text("Sign up Failed"),
              content: Text(e.toString()),
            );
          });
    }
  }

  login(data, context) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: data['email'],
        password: data['password'],
      );
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => Dashboard())
      );
    } catch (e) {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text("Login Error"),
              content: Text(e.toString()),
            );
          });
    }
  }

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  Future<void> signInWithGoogle(BuildContext context) async {
  final scaffoldContext = ScaffoldMessenger.of(context);
  try {
    final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
    if (googleUser == null) {
      // User canceled the sign-in
      return;
    }

    final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
    final AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    final UserCredential userCredential = await _auth.signInWithCredential(credential);

    final User? user = userCredential.user;

    if (user != null) {
      // Check if the user's document exists in Firestore
      final userDocRef = FirebaseFirestore.instance.collection('users').doc(user.uid);
      final userDoc = await userDocRef.get();

      if (!userDoc.exists) {
        // Create a new user document if it doesn't exist
        await userDocRef.set({
          'name': user.displayName,
          'email': user.email,
          'remainingAmount': 0, // Initialize remainingAmount
          'totalCredit': 0,     // Initialize totalCredit
          'totalDebit': 0,      // Initialize totalDebit
          // Add other relevant fields here
        });
      } else {
        // Ensure that the existing user document contains the required fields
        Map<String, dynamic> data = userDoc.data() as Map<String, dynamic>;
        if (!data.containsKey('remainingAmount') || !data.containsKey('totalCredit') || !data.containsKey('totalDebit')) {
          await userDocRef.update({
            'remainingAmount': data.containsKey('remainingAmount') ? data['remainingAmount'] : 0,
            'totalCredit': data.containsKey('totalCredit') ? data['totalCredit'] : 0,
            'totalDebit': data.containsKey('totalDebit') ? data['totalDebit'] : 0,
          });
        }
      }

      // Navigate to Dashboard on successful sign-in
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Dashboard()),
      );
    }
  } on FirebaseAuthException catch (e) {
    scaffoldContext.showSnackBar(SnackBar(content: Text(e.message ?? "An unknown error occurred.")));
  } catch (e) {
    scaffoldContext.showSnackBar(SnackBar(content: Text(e.toString())));
  }
}


Future<void> signOut(BuildContext context) async {
    try {
      await _googleSignIn.signOut();
      await _auth.signOut();
      Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => LoginView()),
                    (route) => false,
                  );
    } catch (e) {
      print(e.toString());
      // Handle error
    }
  }
}
