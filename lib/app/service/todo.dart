import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

const String baseUrl = 'http://192.168.1.7:8000/api';
const secureStorage = FlutterSecureStorage();

Future<Map<String, dynamic>> show() async {
  final url = Uri.parse('$baseUrl/user/todos');
  final accessToken = await secureStorage.read(key: 'access_token');

  try {
    final response = await http.get(
      url,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $accessToken'
      },
    );

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      final error = json.decode(response.body);
      throw Exception('show failed: ${error['message'] ?? 'Server error'}');
    }
  } catch (e) {
    throw Exception('show failed: $e');
  }
}

Future<void> store(String id, String task, bool status) async {
  final url = Uri.parse('$baseUrl/user/todos');
  final accessToken = await secureStorage.read(key: 'access_token');

  try {
    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $accessToken'
      },
      body: json.encode({
        'id': id,
        'todo': task,
        'status': status == false ? "aktif" : "selesai",
      }),
    );

    if (response.statusCode == 201) {
      final data = json.decode(response.body);
      print('berhasil ${data['message']}');
    } else {
      final error = json.decode(response.body);
      throw Exception('insert failed: ${error['message'] ?? 'Server error'}');
    }
  } catch (e) {
    throw Exception('insert failed: $e');
  }
}

Future<void> activate(String id, bool status) async {
  final url = Uri.parse('$baseUrl/user/todos/$id');
  final accessToken = await secureStorage.read(key: 'access_token');

  try {
    final response = await http.put(
      url,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $accessToken'
      },
      body: json.encode({
        'status': status == false ? "aktif" : "selesai",
      }),
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      print('berhasil ${data['message']}');
    } else {
      final error = json.decode(response.body);
      throw Exception('update failed: ${error['message'] ?? 'Server error'}');
    }
  } catch (e) {
    throw Exception('update failed: $e');
  }
}

Future<void> update(String id, String todo) async {
  final url = Uri.parse('$baseUrl/user/todos/$id');
  final accessToken = await secureStorage.read(key: 'access_token');

  try {
    final response = await http.put(
      url,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $accessToken'
      },
      body: json.encode({
        'todo': todo,
      }),
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      print('berhasil ${data['message']}');
    } else {
      final error = json.decode(response.body);
      throw Exception('update failed: ${error['message'] ?? 'Server error'}');
    }
  } catch (e) {
    throw Exception('update failed: $e');
  }
}

Future<void> delete(String id) async {
  final url = Uri.parse('$baseUrl/user/todos/$id');
  final accessToken = await secureStorage.read(key: 'access_token');

  try {
    final response = await http.delete(
      url,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $accessToken'
      },
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      print('berhasil ${data['message']}');
    } else {
      final error = json.decode(response.body);
      throw Exception('delete failed: ${error['message'] ?? 'Server error'}');
    }
  } catch (e) {
    throw Exception('delete failed: $e');
  }
}
