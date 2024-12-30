import 'package:flutter/material.dart';
import 'dart:async';

import 'package:mws_responsi/app/screens/login.dart';
import 'package:mws_responsi/app/screens/mainPage.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: const SplashScreen(),
        theme: ThemeData(fontFamily: "Poppins"));
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  int _counter = 3; // Durasi splash screen dalam detik
  final secureStorage = const FlutterSecureStorage();

  @override
  void initState() {
    super.initState();

    // Timer untuk menghitung mundur dan pindah ke halaman berikutnya setelah waktu habis
    Timer.periodic(const Duration(seconds: 1), (timer) async {
      if (_counter == 1) {
        timer.cancel();

        final accessToken = await secureStorage.read(key: 'access_token');
        if (accessToken != null) {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => const MainPage()),
          );
        } else {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => const LoginPage()),
          );
        }
      } else {
        setState(() {
          _counter--;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Logo di tengah
            Image.asset(
              'assets/logo.jpg', // Masukkan path logo kamu di sini
            ),
            const SizedBox(height: 20),
            // Teks yang menampilkan hitungan mundur
            Text(
              'Loading Time $_counter Detik', // Hitungan mundur
              style: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w800,
                  color: Colors.blue,
                  fontFamily: "PostNoBillsColombo"),
            ),
          ],
        ),
      ),
    );
  }
}
