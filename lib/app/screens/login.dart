import 'package:flutter/material.dart';
import 'package:mws_responsi/app/screens/regist.dart';
import 'package:mws_responsi/app/screens/mainPage.dart';
import 'dart:convert'; // Tambahkan ini untuk memparsing JSON
import 'package:mws_responsi/app/service/auth.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;
  String _fetchedData = "";

  void loginRequest() async {
    setState(() {
      _isLoading = true;
    });

    try {
      await login(_emailController.text, _passwordController.text);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Login berhasil!")),
      );
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const MainPage()),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Login gagal: $e")),
      );
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  void handleFetchData() async {
    try {
      final jsonResponse = await fetchProtectedData();
      final Map<String, dynamic> data = jsonDecode(jsonResponse);
      setState(() {
        _fetchedData = '''
id: ${data['id']}
nama: ${data['name']}
email: ${data['email']}
akun dibuat: ${data['created_at']}
        ''';
      });
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Data berhasil diambil!")),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Gagal mengambil data: $e")),
      );
    }
  }

  void _login() {
    if (_formKey.currentState!.validate()) {
      loginRequest();
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
                  // Logo
                  const SizedBox(height: 46),
                  Image.asset(
                    'assets/logo.jpg',
                  ),
                  const SizedBox(height: 16),

                  // Title
                  const Text(
                    'Masuk',
                    style: TextStyle(
                      fontSize: 38,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
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
                  const SizedBox(height: 20),
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
                  // Password Field
                  TextFormField(
                    controller: _passwordController,
                    decoration: InputDecoration(
                      labelText: 'Masukan Password',
                      labelStyle: const TextStyle(fontSize: 12),
                      floatingLabelStyle:
                          const TextStyle(color: Color(0xFF4285F4)),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Color(0xFF4285F4)),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Color(0xFF4285F4)),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Color(0xFFE53935)),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Color(0xFFD32F2F)),
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    obscureText: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Password tidak boleh kosong';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),

                  // Register and Forgot Password Links
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Belum Punya Akun?",
                            style: TextStyle(fontSize: 13),
                          ),
                          GestureDetector(
                            onTap: () {
                              // Navigate to the registration page when "Daftar" is clicked
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => DaftarPage()),
                              );
                            },
                            child: const Text(
                              'Daftar',
                              style:
                                  TextStyle(color: Colors.blue, fontSize: 13),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 45),

                  ElevatedButton(
                    onPressed: _isLoading ? null : _login,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF4285F4),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 50, vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: Text(
                      _isLoading ? "Loading..." : 'Masuk',
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
