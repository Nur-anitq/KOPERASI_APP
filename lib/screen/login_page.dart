import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late Size mediaSize;
  TextEditingController userController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool rememberUser = false;

  @override
  Widget build(BuildContext context) {
    mediaSize = MediaQuery.of(context).size;
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/bg.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(children: [
          Positioned(top: 80, child: _buildTop()),
          Positioned(bottom: 0, child: _buildBottom()),
        ]),
      ),
    );
  }
  Widget _buildTop(){
    return SizedBox(
      width: mediaSize.width,
      child: const Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.location_city_sharp,
          size: 100,
          color: Colors.white,
          ),
          Text(
            "KOPERASI SMART",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 40,
              letterSpacing: 2),
            )
          
        ],
      ),
    );

  }
  Widget _buildBottom(){
    return SizedBox(
      width: mediaSize.width,
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
  // Widget _buildForm(){
  //   return const Column(
  //     crossAxisAlignment: CrossAxisAlignment.start,
  //     children: [
  //       Text("ยินดีต้อนรับเข้าสู่ระบบ",
  //       style: TextStyle(
  //         color: Color.fromRGBO(0, 71, 25, 0.984), fontSize: 32, fontWeight: FontWeight.bold),
  //       ),
  //       _buildGreyText("เลขทะเบียนสมาชิก 10 หลัก"),
  //     ],
  //   );
  // }
  Widget _buildForm() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "ยินดีต้อนรับเข้าสู่ระบบ",
          style: TextStyle(
              color: Color.fromRGBO(0, 71, 25, 0.984), fontSize: 32, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 60),
        _buildGreyText("เลขทะเบียนสมาชิก 10 หลัก"),
        _buildInputField(userController),
         const SizedBox(height: 40),
        _buildGreyText("รหัสผ่าน"),
        _buildInputField(passwordController, isPassword: true),
        const SizedBox(height: 20),
         _buildRememberForgot(),
         const SizedBox(height: 60),
         _buildLoginButton(),

      ],
    );
  }
  Widget _buildGreyText(String text) {
    return Text(
      text,
      style: const TextStyle(color: Color.fromARGB(255, 47, 47, 47),fontSize: 18),
    );
  }
  Widget _buildInputField(TextEditingController controller,
      {isPassword = false}) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        suffixIcon: isPassword ? Icon(Icons.remove_red_eye) : Icon(Icons.done),
      ),
      obscureText: isPassword,
    );
  }
   Widget _buildRememberForgot() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Checkbox(
                value: rememberUser,
                onChanged: (value) {
                  setState(() {
                    rememberUser = value!;
                  });
                }),
            _buildGreyText("จดจำรหัสผ่าน"),
          ],
        ),
        TextButton(
            onPressed: () {}, child: _buildGreyText("ลืมรหัสผ่าน?"))
      ],
    );
  }
  Widget _buildLoginButton() {
    return ElevatedButton(
      onPressed: () {
        debugPrint("เลขทะเบียนสมาชิก 10 หลัก : ${userController.text}");
        debugPrint("รหัสผ่าน : ${passwordController.text}");
      },
      style: ElevatedButton.styleFrom(
        shape: const StadiumBorder(),
        elevation: 20,
        shadowColor: Color.fromRGBO(28, 136, 66, 0.98),
        minimumSize: const Size.fromHeight(60),
      ),
      child: const Text("เข้าสู่ระบบ"),
    );
  }
}