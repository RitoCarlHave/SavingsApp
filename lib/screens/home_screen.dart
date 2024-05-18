import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application/screens/login_screen.dart';
import 'package:flutter_application/widgets/add_transaction_form.dart';
import 'package:flutter_application/widgets/hero_card.dart';
import 'package:flutter_application/widgets/transactions_cards.dart';

//ignore_for_file: prefer_const_constructors
//ignore_for_file: prefer_const_literals_to_create_immutables
//ignore_for_file: use_build_context_synchronously

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var isLogoutLoading = false;
  logOut() async {
    setState(() {
      isLogoutLoading = true;
    });
    

    await FirebaseAuth.instance.signOut();
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: ((context) => LoginView())));

    setState(() {
      isLogoutLoading = false;
    });
  }
  
  final userId = FirebaseAuth.instance.currentUser!.uid;
  _dialoBuilder(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: AddTransactionForm(),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          backgroundColor: Color.fromRGBO(197, 125, 117, 1.0),
          onPressed: (() {
            _dialoBuilder(context);
          }),
          child: Icon(
            Icons.add,
            color: Colors.white,
          ),
        ),
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(197, 125, 117, 1.0),
          title: Text("Hello, ", style: TextStyle(color: Colors.white)),
          actions: [
            IconButton(
                onPressed: () {
                  logOut();
                },
                icon: isLogoutLoading
                    ? CircularProgressIndicator()
                    : Icon(Icons.exit_to_app, color: Colors.white))
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              HeroCard(userId: userId,),
              TransactionsCards(),
            ],
          ),
        ));
  }
}
