import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

// Function to get login response
Future<Map<String, dynamic>> getLogin(String memberNo, String password, String brNo) async {
  const String baseUrl = 'YOUR_BASE_URL';
  const String endpoint = 'login_user.php';
  const int timeout = 10; // Timeout duration in seconds

  SharedPreferences prefs = await SharedPreferences.getInstance();
  String token = prefs.getString('token') ?? '';

  Map<String, String> headers = {
    'Content-Type': 'application/x-www-form-urlencoded',
  };

  Map<String, String> body = {
    'member_no': memberNo,
    'br_no': brNo,
    'password': password,
    'token': token,
    'login_type': 'android',
  };

  try {
    final response = await http
        .post(
          Uri.parse('$baseUrl$endpoint'),
          headers: headers,
          body: body,
        )
        .timeout(Duration(seconds: timeout));

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load data');
    }
  } catch (e) {
    print(e.toString());
    return {};
  }
}

// Function to get member number and branch number
String getMemberNo(String username) {
  // Replace with actual logic to get member number from username
  return 'sample_member_no';
}

String getMemberBr(String username) {
  // Replace with actual logic to get branch number from username
  return 'sample_br_no';
}

// Function to perform login in background
Future<Map<String, dynamic>> performLogin(String username, String password, bool status) async {
  Map<String, dynamic> json = {};

  if (status) {
    String memberNo = getMemberNo(username);
    String brNo = getMemberBr(username);

    json = await getLogin(memberNo, password, brNo);
  }

  return json;
}

// Example usage within a Flutter widget
class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _status = true; // Example status variable

  void _login() async {
    String username = _usernameController.text;
    String password = _passwordController.text;

    Map<String, dynamic> response = await performLogin(username, password, _status);

    // Handle the response
    if (response.isNotEmpty) {
      // Login successful
      print('Login successful: $response');
    } else {
      // Login failed
      print('Login failed');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _usernameController,
              decoration: InputDecoration(labelText: 'Username'),
            ),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _login,
              child: Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}
