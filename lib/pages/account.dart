import 'package:flutter/material.dart';
import 'package:mws_responsi/pages/kelolaprofile.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: ProfileScreen(),
      ),
    );
  }
}

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          const SizedBox(
            height: 50,
          ),
          // Top Profile Section
          Container(
            width: 132,
            height: 220,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: const Color(0xFFECE6F0),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/media.png',
                  height: 120,
                ),
                const Text(
                  'Ibnu Abdul Aziz Alqalibi',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.center,
                ),
                const Text(
                  'Universitas Teknologi Yogyakarta',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),

          // Options List
          ListTile(
            title: const Text('Kelola Akun'),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              // Navigate to KelolaProfilePage
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => KelolaProfilePage()),
              );
            },
          ),
          ListTile(
            title: const Text('Notifikasi'),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              // Add your navigation or actions here
            },
          ),
          ListTile(
            title: const Text('Privacy Policy'),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              // Add your navigation or actions here
            },
          ),
          ListTile(
            title: const Text('Terms of Service'),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              // Add your navigation or actions here
            },
          ),
        ],
      ),
    );
  }
}
