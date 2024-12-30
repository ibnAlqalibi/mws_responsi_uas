import 'package:flutter/material.dart';
import 'package:mws_responsi/app/service/auth.dart';
import 'package:mws_responsi/app/screens/login.dart';

class DaftarPage extends StatefulWidget {
  DaftarPage({super.key});

  @override
  _DaftarPageState createState() => _DaftarPageState();
}

class _DaftarPageState extends State<DaftarPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;

  void registRequest() async {
    setState(() {
      _isLoading = true;
    });

    try {
      await register(_nameController.text, _emailController.text,
          _passwordController.text, _confirmPasswordController.text);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Register berhasil!")),
      );
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const LoginPage()),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Register gagal: $e")),
      );
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  void _register() {
    if (_formKey.currentState!.validate()) {
      registRequest();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 46.0),
            child: Form(
              key: _formKey,
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
                      child: Text("Masukkan Nama",
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w400)),
                    ),
                  ),
                  // Email Input
                  TextField(
                    controller: _nameController,
                    decoration: InputDecoration(
                      labelText: 'Masukan Nama',
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
                      child: Text("Masukkan Email",
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w400)),
                    ),
                  ),
                  // Email Input
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
                    controller: _passwordController,
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
                    controller: _confirmPasswordController,
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
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const LoginPage()),
                              );
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
                    onPressed: _isLoading ? null : _register,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF4285F4),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 50, vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: Text(
                      _isLoading ? "Loading..." : 'Daftar',
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ],
              ),
            )),
      ),
    );
  }
}
