import 'package:flutter/material.dart';
import 'package:mws_responsi/pages/account.dart';
import 'package:mws_responsi/app/screens/login.dart';
import 'package:mws_responsi/app/screens/home.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndex = 0;
  IconData _homeIcon = Icons.home_filled;
  IconData _userIcon = Icons.account_circle_outlined;
  final secureStorage = const FlutterSecureStorage();

  final List<Widget> _pages = [
    const HomePage(),
    const ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex], // Show the current page
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (int index) {
          if (index == 0) {
            setState(() {
              _currentIndex = index;
            });
            _homeIcon = Icons.home_filled;
            _userIcon = Icons.account_circle_outlined;
          } else if (index == 1) {
            setState(() {
              _currentIndex = index;
            });
            _userIcon = Icons.account_circle_sharp;
            _homeIcon = Icons.home_outlined;
          } else if (index == 2) {
            _showLogoutDialog(context);
          }
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(_homeIcon),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(_userIcon),
            label: 'Akun',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.logout_outlined),
            label: 'Logout',
          ),
        ],
      ),
    );
  }

  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Logout'),
          content: const Text('Apakah Anda yakin ingin logout?'),
          actions: [
            TextButton(
              child: const Text('Batal'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Logout'),
              onPressed: () async {
                await secureStorage.delete(key: 'access_token');
                Navigator.of(context).pop();
                // Navigate to Home page
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginPage()),
                );
              },
            ),
          ],
        );
      },
    );
  }
}
