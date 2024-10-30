import 'package:flutter/material.dart';
import 'package:mws_responsi/pages/account.dart';

// KelolaProfilePage for managing profile
class KelolaProfilePage extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _namaController = TextEditingController();
  final TextEditingController _nomorTeleponController = TextEditingController();
  final TextEditingController _alamatController = TextEditingController();

  KelolaProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
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
              const Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 8, horizontal: 5.17),
                  child: Text("Email",
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w400)),
                ),
              ),
              // Email Field
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: 'Email',
                  labelStyle: const TextStyle(fontSize: 12),
                  floatingLabelStyle: const TextStyle(color: Color(0xFF4285F4)),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Color(0xFF4285F4)),
                    borderRadius: BorderRadius.circular(
                        12), // Custom color for default border
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Color(0xFF4285F4)),
                    borderRadius:
                        BorderRadius.circular(12), // Custom color when focused
                  ),
                ),
              ),

              const Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 8, horizontal: 5.17),
                  child: Text("Nama",
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w400)),
                ),
              ),
              TextFormField(
                controller: _namaController,
                decoration: InputDecoration(
                  labelText: 'Nama',
                  labelStyle: const TextStyle(fontSize: 12),
                  floatingLabelStyle: const TextStyle(color: Color(0xFF4285F4)),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Color(0xFF4285F4)),
                    borderRadius: BorderRadius.circular(
                        12), // Custom color for default border
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Color(0xFF4285F4)),
                    borderRadius:
                        BorderRadius.circular(12), // Custom color when focused
                  ),
                ),
              ),

              const Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 8, horizontal: 5.17),
                  child: Text("Nomor Telepon",
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w400)),
                ),
              ),
              TextFormField(
                controller: _nomorTeleponController,
                decoration: InputDecoration(
                  labelText: 'Nomor Telepon',
                  labelStyle: const TextStyle(fontSize: 12),
                  floatingLabelStyle: const TextStyle(color: Color(0xFF4285F4)),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Color(0xFF4285F4)),
                    borderRadius: BorderRadius.circular(
                        12), // Custom color for default border
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Color(0xFF4285F4)),
                    borderRadius:
                        BorderRadius.circular(12), // Custom color when focused
                  ),
                ),
              ),

              const Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 8, horizontal: 5.17),
                  child: Text("Alamat",
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w400)),
                ),
              ),
              TextFormField(
                controller: _alamatController,
                decoration: InputDecoration(
                  labelText: 'Alamat',
                  labelStyle: const TextStyle(fontSize: 12),
                  floatingLabelStyle: const TextStyle(color: Color(0xFF4285F4)),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Color(0xFF4285F4)),
                    borderRadius: BorderRadius.circular(
                        12), // Custom color for default border
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Color(0xFF4285F4)),
                    borderRadius:
                        BorderRadius.circular(12), // Custom color when focused
                  ),
                ),
              ),
              const SizedBox(height: 20),

              ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ProfilePage()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF4285F4),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text(
                  'Ubah Profil',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.w600),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
