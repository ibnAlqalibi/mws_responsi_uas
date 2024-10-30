import 'package:flutter/material.dart';

class DaftarPage extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  DaftarPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 46.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 46),
                // Logo Section
                Image.asset(
                  'assets/logo.jpg',
                ),
                const SizedBox(height: 16),
                // Page Title
                const Text(
                  'Daftar',
                  style: TextStyle(
                    fontSize: 38,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 30),
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
                // Email Input
                TextField(
                  controller: emailController,
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
                ),
                const SizedBox(height: 12),
                const Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 8, horizontal: 5.17),
                    child: Text("Masukkan Password",
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w400)),
                  ),
                ),
                // Password Input
                TextField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Masukan Password',
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
                ),
                const SizedBox(height: 12),
                const Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 8, horizontal: 5.17),
                    child: Text("Masukkan Kembali Password",
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w400)),
                  ),
                ),
                // Confirm Password Input
                TextField(
                  controller: confirmPasswordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Masukan kembali Password',
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
                ),
                const SizedBox(height: 8),

                // Already have an account (Masuk)
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("Sudah memiliki akun? "),
                        GestureDetector(
                          onTap: () {
                            // Navigate to the login page
                            Navigator.pop(context);
                          },
                          child: const Text(
                            'Masuk',
                            style: TextStyle(
                              color: Colors.blue,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                const SizedBox(height: 40),

                // Daftar Button
                ElevatedButton(
                  onPressed: () {
                    // After signup, navigate back to login page
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
                    'Daftar',
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
      ),
    );
  }
}
