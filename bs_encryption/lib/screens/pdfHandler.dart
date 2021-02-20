import 'package:advance_pdf_viewer/advance_pdf_viewer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class pdfHandler extends StatefulWidget {
  pdfShower createState() => pdfShower();
}

class pdfShower extends State<pdfHandler> {
  PDFDocument document;
  bool _isLoading;
  @override
  void initState(){
    super.initState();
    docSelect();
  }
  Future<void> docSelect() async {
    document = await PDFDocument.fromAsset('assets/sample.pdf');
    setState(() => _isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text("Estatemenet")),
        body: Center(
          child: _isLoading
              ? Center(child: CircularProgressIndicator())
              : PDFViewer(document: document, zoomSteps: 1),
        ),
      ),
    );
  }
}
