import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pdfx/pdfx.dart';

class UserPage extends StatefulWidget {
  const UserPage({super.key});

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  final FirebaseAuth auth = FirebaseAuth.instance;

  final pdfController = PdfController(
    document: PdfDocument.openAsset('assets/pdfs/2021ENGG_CAP1_CutOff.pdf'),
    viewportFraction: 2
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(auth.currentUser!.displayName!),
      ),
    );
  }
}
