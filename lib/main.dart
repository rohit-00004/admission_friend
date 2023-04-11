import 'package:admission_friend/database/dbhelper.dart';
import 'package:admission_friend/screens/onboarding.dart';
import 'package:admission_friend/screens/user_profile.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:flutter/material.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  //  WidgetsFlutterBinding.ensureInitialized();
 await Firebase.initializeApp(
 );
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
    // const providers = [EmailAuthProvider()];
    List<AuthProvider<AuthListener, auth.AuthCredential>>?  providers = [EmailAuthProvider()];

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Admission friend',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        primaryColor: const Color(0xff3b1791),
        // primarySwatch: Color.fromARGB(255, 220, 4, 220),
      ),
      // home: ConcentricAnimationOnboarding(db: db),
      initialRoute: '/sign-in',
      routes: {
        '/sign-in': (context) {
          return SignInScreen(
            providers: providers,
            actions: [
              AuthStateChangeAction<SignedIn>((context, state) {
                // Navigator.pushReplacementNamed(context, '/user');
                Navigator.pushReplacementNamed(context, '/onboarding');
              }),
            ],
          );
        },
        '/user' : (context) => const UserPage(),
        '/onboarding': (context) => ConcentricAnimationOnboarding(db: db), 
      },
    );
  }
}