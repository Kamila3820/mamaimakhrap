import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'model/QRCodeGenerator.dart';

class QRCodeScreen extends StatefulWidget {
  @override
  _QRCodeScreenState createState() => _QRCodeScreenState();
}

class _QRCodeScreenState extends State<QRCodeScreen> {
  String _qrData = '';
  TimeOfDay _endTime = TimeOfDay(hour: 0, minute: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('QR Code Screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                _showQrCodeGeneratorDialog(context);
              },
              child: Text('Generate QR Code'),
            ),
          ],
        ),
      ),
    );
  }

  void _showQrCodeGeneratorDialog(BuildContext context) {
    int _numberOfStudents = 0;
    int _maxScan = 0;
   showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Generate QR Code'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                decoration: InputDecoration(
                  labelText: 'Enter number of students',
                ),
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  setState(() {
                    _numberOfStudents = int.tryParse(value) ?? 0;
                  });
                },
              ),
              SizedBox(height: 16),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Enter maximum number of scans',
                ),
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  setState(() {
                    _maxScan = int.tryParse(value) ?? 0;
                  });
                },
              ),
              SizedBox(height: 16),
              InkWell(
                onTap: () async {
                  final TimeOfDay? selectedTime = await showTimePicker(
                    context: context,
                    initialTime: _endTime,
                  );
                  if (selectedTime != null) {
                    setState(() {
                      _endTime = selectedTime;
                    });
                  }
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'End Time',
                      style: TextStyle(fontSize: 16),
                    ),
                    Text(
                      _endTime.format(context),
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => QRCodeGenerator(
                      data: '$_numberOfStudents:${_endTime.format(context)}:$_maxScan',studentNumber: '', maxScan: _maxScan,
                    ),
                  ),
                );
              },
              child: Text('Generate'),
            ),
          ],
        );
      },
    );
  }}