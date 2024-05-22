import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application/services/auth_service.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    User? user = FirebaseAuth.instance.currentUser;
    return Scaffold(
      appBar: AppBar(
          title: Text("Settings"),
        ),
      body: Center(
        child: Column(
          children: [
            Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Colors.white,
                    width: 1,
                  ),
                ),
                child: Container(
                  width: 100,
                  height: 100,
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(
                      user?.photoURL ??
                          'https://images.app.goo.gl/LEQrX3wnxp2FrQny8',
                    ),
                    backgroundColor: Colors.white,
                    radius: 30,
                  ),
                ),
              ),
              SizedBox(height: 20,),
              Text(
                user?.email ?? 'No Email',
                style: const TextStyle(fontSize: 18, color: Colors.black),
              ),
              SizedBox(height: 20,),
            ElevatedButton(
                      onPressed: () async {
                        await AuthService().signOut(context);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromRGBO(197, 125, 117, 1.0),
                        fixedSize: const Size(150, 50),
                      ),
                      child: const Text(
                        'Sign Out',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
          ],
        ),
      ),
      );
  }
}