import 'package:flutter/material.dart';
import 'package:flutter_application/screens/dashboard.dart';
import 'package:flutter_application/services/auth_service.dart';
import 'package:flutter_application/utils/appvalidator.dart';

//ignore_for_file: prefer_const_constructors

import 'login_screen.dart';

class SignUpView extends StatefulWidget {
  SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final _userNameController = TextEditingController();

  final _emailController = TextEditingController();

  final _phoneController = TextEditingController();

  final _passwordController = TextEditingController();

  var authService = AuthService();
  var isLoader = false;
  bool _obscureText = true;

  Future<void> _submitForm() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        isLoader = true;
      });

      var data = {
        "username": _userNameController.text,
        "email": _emailController.text,
        "password": _passwordController.text,
        "phone": _phoneController.text,
        'remainingAmount':0,
        'totalCredit':0,
        'totalDebit': 0,  
      };

      await authService.createUser(data, context);
      
      setState(() {
        isLoader = false;
      });
     // ScaffoldMessenger.of(_formKey.currentContext!).showSnackBar(
       // const SnackBar(content: Text('Form submitted successfully')),
      //);
    }
  }

  var appValidator = AppValidator();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 5.0,
                      ),
            
                      SizedBox(
                        width: 220,
                        height: 220,
                        child: Image.asset(
                          'assets/ListApp1.png',
                          width:
                              1000, // Set the same width as the SizedBox if needed
                          height:
                              1000, // Make sure the image is in your assets folder
                          fit: BoxFit.contain,
                        ),
                      ),
                      SizedBox(
                        height: 4.0,
                      ),
                      TextFormField(
                        controller: _userNameController,
                        style: TextStyle(
                          color: Colors.black,
                        ),
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        decoration: _buildInputDecoration("Username", Icons.person),
                        validator: appValidator.validateUsername,
                      ),
                      SizedBox(
                        height: 16.0,
                      ),
                      TextFormField(
                        controller: _emailController,
                        keyboardType: TextInputType.emailAddress,
                        style: TextStyle(
                          color: Colors.black,
                        ),
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        decoration: _buildInputDecoration("Email", Icons.email),
                        validator: (appValidator.validateEmail),
                      ),
                      SizedBox(
                        height: 16.0,
                      ),
                      TextFormField(
                        controller: _phoneController,
                        style: TextStyle(
                          color: Colors.black,
                        ),
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        decoration:
                            _buildInputDecoration("Phone Number", Icons.phone),
                        validator: appValidator.validatePhoneNumber,
                      ),
                      SizedBox(
                        height: 16.0,
                      ),
                      TextFormField(
                        controller: _passwordController,
                        style: TextStyle(
                          color: Colors.black,
                        ),
                        
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        decoration: _buildInputDecoration("Password", Icons.lock),
                        validator: appValidator.validatePassword,
                        obscureText: _obscureText,
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      SizedBox(
                        height: 50,
                        width: double.infinity,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color.fromRGBO(197, 125, 117, 1.0)
                          ),
                          onPressed: () {
                            isLoader ? print("Loading"): _submitForm();
            
                          },
                          child: isLoader 
                          ? Center(child: CircularProgressIndicator()):
                          Text("Create",
                          style: TextStyle(fontSize: 20, color: Colors.white),),
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      TextButton (
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LoginView()),
                            );
                          },
                          child: Text(
                            "Login",
                            style: TextStyle(color: Color.fromRGBO(197, 125, 117, 1.0), fontSize: 25),
                          )),
                    ],
                  )),
            ),
          )),
    );
  }

  InputDecoration _buildInputDecoration(String label, IconData suffixIcon) {
    return InputDecoration(
        fillColor: Colors.white,
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color.fromRGBO(197, 125, 117, 1.0))),
        focusedBorder:
            OutlineInputBorder(borderSide: BorderSide(color: Color.fromRGBO(197, 125, 117, 1.0))),
        filled: true,
        labelStyle: TextStyle(color: Color.fromRGBO(197, 125, 117, 1.0)),
        labelText: label,
        suffixIcon: Icon(suffixIcon, color: Color.fromRGBO(197, 125, 117, 1.0)),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)));
  }
}
