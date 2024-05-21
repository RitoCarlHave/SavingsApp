import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application/screens/dashboard.dart';
import 'package:flutter_application/screens/home_screen.dart';
import 'package:flutter_application/screens/sign_up.dart';
import 'package:flutter_application/services/auth_service.dart';
import 'package:flutter_application/utils/appvalidator.dart';


//ignore_for_file: prefer_const_constructors
//ignore_for_file: prefer_const_literals_to_create_immutables


class LoginView extends StatefulWidget {
  // ignore: prefer_const_constructors_in_immutables
  LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  var isLoader = false;
  var authService = AuthService();
  // ignore: prefer_final_fields
  bool _obscureText = true;

  Future<void> _submitForm() async {
    if (_formKey.currentState!.validate()) {
            setState(() {
        isLoader = true;
      });

      var data = {
        "email": _emailController.text,
        "password": _passwordController.text,
        
      };

      await authService.login(data, context);
      
      setState(() { 
        isLoader = false;
      });
    }
  }



  var appValidator = AppValidator();
  


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
              key: _formKey,
              child: Column(
                children: [
                  SizedBox(
                    height: 10.0,
                  ),
                  SizedBox(
                    width: 250,
                    height: 250,
                    child: Image.asset(
                      'assets/ListApp.png',
                      width:
                          1000, // Set the same width as the SizedBox if needed
                      height:
                          1000, // Make sure the image is in your assets folder
                      fit: BoxFit.contain,
                    ),
                  ),
                  
                  SizedBox(
                    height: 4,
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
                      Text("Login",
                      style: TextStyle(fontSize: 20, color: Colors.white),),
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  TextButton(onPressed: () {
                    Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SignUpView()),
                        );
                  }, 
                  child: Text("Create new account", 
                  style: 
                  TextStyle(color: Color.fromRGBO(197, 125, 117, 1.0), fontSize: 25),)
                  ),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: Divider(
                            thickness: 0.5,
                            color: Color.fromRGBO(197, 125, 117, 1.0),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: Text(
                            'Or continue with',
                            style: TextStyle(color: Color.fromRGBO(197, 125, 117, 1.0)),
                          ),
                        ),
                        Expanded(
                          child: Divider(
                            thickness: 0.5,
                            color: Color.fromRGBO(197, 125, 117, 1.0),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 15,),
                  TextButton(onPressed: () => AuthService().signInWithGoogle(context), 
                  child: Image.asset(
                    'assets/google.png', 
                    height: 50,
                    width: 50,))
                ],
              )),
        ));
  }

  InputDecoration _buildInputDecoration(String label, IconData suffixIcon) {
    return InputDecoration(
        fillColor: Colors.white,
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color.fromRGBO(197, 125, 117, 1.0))),
        focusedBorder:
            OutlineInputBorder(borderSide: BorderSide(color: Color.fromRGBO(197, 125, 117, 1.0))),
        filled: true,
        labelStyle: TextStyle(color:Color.fromRGBO(197, 125, 117, 1.0)),
        labelText: label,
        suffixIcon: Icon(suffixIcon, color: Color.fromRGBO(197, 125, 117, 1.0)),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)));
  }
}

// Color.fromRGBO(74, 121, 83, 1)    red
//Color.fromRGBO(197, 125, 117, 1.0)   pink
//Color.fromRGBO(52, 81, 58, 1.0)   green