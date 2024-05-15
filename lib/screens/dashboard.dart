import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application/screens/login_screen.dart';
import 'package:flutter_application/widgets/navbar.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  var isLogoutLoading = false;
  int currentIndex = 0;

  logOut() async {
    setState(() {
      isLogoutLoading = true;
    });
    await FirebaseAuth.instance.signOut();
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: ((context) => LoginView()))
      );

    setState(() {
      isLogoutLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavBar(
        selectedIndex: currentIndex, 
        onDestinationSelected: (int value) {  
          setState(() {
            currentIndex = value;
          });
        },),
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                logOut();
              },
              icon: isLogoutLoading
                  ? CircularProgressIndicator()
                  : Icon(Icons.exit_to_app))
        ],
      ),
      body: Text("Hello"),
    );
  }
}
