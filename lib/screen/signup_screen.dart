import 'package:flutter/material.dart';
import 'package:koperasiapp/widgets/custtom_scaffold.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  @override
  Widget build(BuildContext context) {
    return const CustomScaffold(
      child: Text('ลงทะเบียนเข้าสู่ระบบบ'),
    );
  }
}