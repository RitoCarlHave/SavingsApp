import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_application/widgets/auth_gate.dart';
import 'firebase_options.dart';

//ignore_for_file: deprecated_member_use
//ignore_for_file: prefer_const_constructors

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
  options: DefaultFirebaseOptions.currentPlatform,
);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Expenses Tracker',
      builder: (context, child) {
        return MediaQuery(
        data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
         child: child!
         );
      },
       theme: ThemeData(
         colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
         useMaterial3: true,
       ),
      debugShowCheckedModeBanner: false,
      home: AuthGate(),
    );
  }
}
