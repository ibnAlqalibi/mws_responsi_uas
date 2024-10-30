import 'package:flutter/material.dart';

class LupaPasswordPage extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();

  LupaPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 46.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 46),
                Image.asset(
                  'assets/logo.jpg',
                ),
                const SizedBox(height: 16),
                // Title
                const Text(
                  'Lupa Password',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 32),
                const Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Pesan',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                  ),
                ),

                const Text(
                    'Masukan email Anda dan tunggu kode etik akan dikirimkan.',
                    style:
                        TextStyle(fontSize: 13, fontWeight: FontWeight.w400)),

                const SizedBox(height: 32),
                const Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 8, horizontal: 5.17),
                    child: Text("Masukkan Email",
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w400)),
                  ),
                ),
                // Email Field
                TextFormField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    labelText: 'Masukan Email',
                    labelStyle: const TextStyle(fontSize: 12),
                    floatingLabelStyle:
                        const TextStyle(color: Color(0xFF4285F4)),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Color(0xFF4285F4)),
                      borderRadius: BorderRadius.circular(
                          12), // Custom color for default border
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Color(0xFF4285F4)),
                      borderRadius: BorderRadius.circular(
                          12), // Custom color when focused
                    ),
                    errorBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Color(0xFFE53935)),
                      borderRadius: BorderRadius.circular(
                          12), // Example custom color for error border
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Color(0xFFD32F2F)),
                      borderRadius: BorderRadius.circular(
                          12), // Custom color when focused with error
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Email tidak boleh kosong';
                    }
                    if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                      return 'Masukan email yang valid';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 200),

                ElevatedButton(
                  onPressed: () {
                    // On button press, navigate back to LoginPage
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF4285F4),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 50, vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    'Kirim',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
