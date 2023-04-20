import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:mamaimakhrap/ConfirmQR.dart';
import 'package:mamaimakhrap/CoursePage.dart';
import 'package:mamaimakhrap/FeedbackPage.dart';
import 'package:mamaimakhrap/HistoryPage.dart';
import 'package:mamaimakhrap/InsideCoursePage.dart';
import 'package:mamaimakhrap/InsideFeedbackPage.dart';
import 'package:mamaimakhrap/QRCodePage.dart';
import 'package:mamaimakhrap/ScanPage.dart';
import 'package:mamaimakhrap/StudentHomePage.dart';
import 'package:mamaimakhrap/TeacherHomePage.dart';
import 'package:mamaimakhrap/TeacherProfile.dart';
import 'package:mamaimakhrap/loginscreen.dart';
import 'package:mamaimakhrap/mainpage.dart';
import 'package:mamaimakhrap/role.dart';
import 'package:mamaimakhrap/studentProfile.dart';
import 'firebase_options.dart';
import 'package:firebase_auth/firebase_auth.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return const mainpage();
            } else {
              return const KeyboardVisibilityProvider(child: LoginScreen());
            }
          },
        ));
  }
}
