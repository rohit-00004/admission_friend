import 'package:admission_friend/database/dbhelper.dart';
import 'package:admission_friend/screens/onboarding.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp( MyApp());
}

// ignore: must_be_immutable
class MyApp extends StatelessWidget {
  late DatabaseHelper db;
  
  MyApp({super.key}){
    db = DatabaseHelper();
    db.insertcolleges();
    db.insertStatelevel();
    db.insertHometoHome();
    db.insertOthertoOther("assets/other_to_other_cutoff.csv", 'other_to_other');
    db.insertOthertoOther("assets/other_to_home_cutoff.csv", 'other_to_home');
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