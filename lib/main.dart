import 'package:admission_friend/database/dbhelper.dart';
import 'package:admission_friend/screens/onboarding.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  late DatabaseHelper db;
  
  MyApp({super.key}){
    db = DatabaseHelper();
    db.insertcolleges();
    db.insertStatelevel();
    db.insertHometoHome();
    db.insertOthertoOther();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Admission friend',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        primaryColor: const Color(0xff3b1791),
        // primarySwatch: Color.fromARGB(255, 220, 4, 220),
      ),
      home: ConcentricAnimationOnboarding(db: db),
    );
  }
}