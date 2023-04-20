import 'package:flutter/material.dart';
import 'package:pdfx/pdfx.dart';

class Pdfview extends StatefulWidget {
  final String filepath;
  const Pdfview({required String this.filepath, super.key});

  @override
  State<Pdfview> createState() => _PdfviewState();
}

class _PdfviewState extends State<Pdfview> {
  late PdfController pdfController;
  late String path;
  @override
  void initState() {
    pdfController = PdfController(
      document: PdfDocument.openAsset(widget.filepath),
    );
    path = widget.filepath.toString();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            path.substring(path.indexOf('/')).substring(path.indexOf('/'))),
      ),
      body: PdfView(
        controller: pdfController,
        scrollDirection: Axis.vertical,
        pageSnapping: false,
        renderer: (PdfPage page) => page.render(
          width: page.width * 1.8,
          height: page.height * 3,
          backgroundColor: '#FFFFFF',
        ),
      ),
    );
  }
}
