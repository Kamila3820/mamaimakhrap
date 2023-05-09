import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:path_provider/path_provider.dart';


class QRCodeGenerator extends StatefulWidget {
  final String data;
  final String studentNumber;
  final int maxScan;

  const QRCodeGenerator(
      {Key? key, required this.data, required this.studentNumber, required this.maxScan})
      : super(key: key);

  @override
  _QRCodeGeneratorState createState() => _QRCodeGeneratorState();
}

class _QRCodeGeneratorState extends State<QRCodeGenerator> {
  late String _qrData;
  late int _scanCount;
  late File _qrFile;

  @override
  void initState() {
    super.initState();
    _qrData = '${widget.studentNumber}:${widget.maxScan}';
    _scanCount = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('QR Code Generator'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            QrImage(
              data: _qrData,
              version: QrVersions.auto,
              size: 200.0,
            ),
            SizedBox(height: 16.0),
            Text(
              'Scan count: $_scanCount',
              style: TextStyle(fontSize: 20.0),
            ),
          ],
        ),
      ),
    );
  }

  
Future<void> _readScanCount() async {
  final directory = await getApplicationDocumentsDirectory();
  final file = File('${directory.path}/scan_count.txt');
  if (await file.exists()) {
    final content = await file.readAsString();
    _scanCount = int.parse(content);
  }
}

Future<void> _writeScanCount() async {
  final directory = await getApplicationDocumentsDirectory();
  final file = File('${directory.path}/scan_count.txt');
  await file.writeAsString('$_scanCount');
  setState(() {
  _scanCount++;
  _writeScanCount();
});
}


}
