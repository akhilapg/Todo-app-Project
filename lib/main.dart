import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'firebase_options.dart';
import 'screens/login_screen.dart';
import 'screens/bottom_nav.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  SharedPreferences prefs =
  await SharedPreferences.getInstance();

  bool isLogin = prefs.getBool("isLogin") ?? false;

  runApp(MyApp(isLogin: isLogin));
}

class MyApp extends StatelessWidget {

  final bool isLogin;

  const MyApp({
    super.key,
    required this.isLogin,
  });

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,

      home: isLogin
          ? const BottomNavPage()
          : const LoginScreen(),
    );
  }
}