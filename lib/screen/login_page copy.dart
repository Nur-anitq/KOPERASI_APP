import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:koperasiapp/screen/signup_screen.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formSignInKey = GlobalKey<FormState>();
  // add 230767
  final _navigatorKey =
      GlobalKey<NavigatorState>(); //เมื่อทำการ login เสร็จทำการเปลี่ยนหน้า
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  Future<void> _login() async {
    final url = Uri.parse('https://www.melivecode.com/api/login');
    final header = {'Content-Type': 'application/json'};
    final body = jsonEncode({
      'username': _usernameController.text,
      'password': _passwordController.text
    });

    final response = await http.post(url, headers: header, body: body);
    if (response.statusCode == 200) {
      final jsonResponse = jsonDecode(response.body);
      _showSnackBar(jsonResponse['message']);
      print('Login successful: $response');
    }
        final jsonResponse = jsonDecode(response.body);
      _showSnackBar(jsonResponse['message']);
    

  }

  void _showSnackBar(String message) {
    final snackBar = SnackBar(
      content: Text(message),
      duration: Duration(seconds: 2),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
  // end add 230767

  bool rememberPassword = true;

  @override
  Widget build(BuildContext context) {
    var mediaSize = MediaQuery.of(context).size;
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/background/bg.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Form(
              key: _formSignInKey,
              child: Stack(children: [
                Positioned(top: 0, child: _buildTop()),
                Positioned(bottom: 0, child: _buildBottom()),
              ]),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTop() {
    var mediaSize = MediaQuery.of(context).size;
    return SafeArea(
      child: Row(
        children: [
          SizedBox(
            width: mediaSize.width * 0.3,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset('assets/images/logo.png', fit: BoxFit.fill),
              ],
            ),
          ),
          const SizedBox(
            width: 10.0,
          ),
          SizedBox(
            width: mediaSize.width * 0.65,
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  "THE ISLAMIC CO-OPERATIVE OF PATTANI LIMITED",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 10,
                  ),
                ),
                Text(
                  "KOPERASI",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 50,
                      letterSpacing: 2),
                ),
                Text(
                  "SMART",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 40,
                      letterSpacing: 2),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBottom() {
    var mediaSize = MediaQuery.of(context).size;
    return SizedBox(
      width: mediaSize.width,
      height: mediaSize.height * 0.7,
      child: Card(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        )),
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: _buildForm(),
        ),
      ),
    );
  }

  Widget _buildForm() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 20.0,
          ),
          const Text(
            'ยินดีต้อนรับเข้าสู่ระบบ',
            style: TextStyle(
              fontSize: 30.0,
              fontWeight: FontWeight.w900,
              color: Color.fromARGB(255, 14, 53, 15),
            ),
          ),
          const SizedBox(
            height: 40.0,
          ),
          TextFormField(
            controller: _usernameController,
            decoration: InputDecoration(
              focusedBorder: const OutlineInputBorder(
                  borderSide:
                      BorderSide(color: Color.fromARGB(255, 14, 53, 15))),
              label: const Text('เลขทะเบียนสมาชิก 10 หลัก'),
              labelStyle:
                  const TextStyle(color: Color.fromARGB(255, 14, 53, 15)),
              hintText: 'กรอกเลขทะเบียนสมาชิก 10 หลัก',
              hintStyle: const TextStyle(
                color: Colors.black26,
              ),
              border: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Colors.black12, // Default border color
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Colors.black12, // Default border color
                ),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            validator: (value) {
              if (value!.isEmpty) {
                return 'โปรดกรอกเลขทะเบียนสมาชิก 10 หลัก';
              }
              return null;
            },
          ),
          const SizedBox(
            height: 40.0,
          ),
          TextFormField(
            controller: _passwordController,
            obscureText: true,
            // obscuringCharacter: '*',
            decoration: InputDecoration(
              focusedBorder: const OutlineInputBorder(
                  borderSide:
                      BorderSide(color: Color.fromARGB(255, 14, 53, 15))),
              label: const Text('รหัสผ่าน'),
              labelStyle:
                  const TextStyle(color: Color.fromARGB(255, 14, 53, 15)),
              hintText: 'กรอกรหัสผ่าน',
              hintStyle: const TextStyle(
                color: Colors.black26,
              ),
              border: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Colors.black12, // Default border color
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Colors.black12, // Default border color
                ),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            validator: (value) {
              if (value!.isEmpty) {
                return 'โปรดกรอกรหัสผ่าน';
              }
              return null;
            },
          ),
          const SizedBox(
            height: 25.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Checkbox(
                    value: rememberPassword,
                    onChanged: (bool? value) {
                      setState(() {
                        rememberPassword = value!;
                      });
                    },
                    activeColor: const Color.fromARGB(255, 14, 53, 15),
                  ),
                  const Text(
                    'บันทึกข้อมูลการเข้าสู่ระบบ',
                    style: TextStyle(
                      color: Colors.black45,
                    ),
                  ),
                ],
              ),
              GestureDetector(
                child: const Text(
                  'ลืมรหัสผ่าน?',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 14, 53, 15),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 25.0,
          ),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                if (_formSignInKey.currentState!.validate()) {
                  _login();
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 14, 53, 15),
                padding:
                    const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
              ),
              child: const Text(
                'เข้าสู่ระบบ',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
            ),
          ),

          const SizedBox(
            height: 25.0,
          ),
          // don't have an account
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'เข้าใช้งานครั้งแรก  ',
                // style: TextStyle(
                //   color: Colors.black12,
                // ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (e) => const SignupScreen(),
                    ),
                  );
                },
                child: const Text(
                  'ลงทะเบียนเข้าสู่ระบบที่นี่',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 14, 53, 15),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 30.0,
          ),
        ],
      ),
    );
  }
}
