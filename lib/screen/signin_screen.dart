import 'package:flutter/material.dart';
import 'package:koperasiapp/widgets/custtom_scaffold.dart';
import 'package:koperasiapp/screen/signup_screen.dart';


class SigninScreen extends StatefulWidget {
  const SigninScreen({super.key});

  @override
  State<SigninScreen> createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {
   final _formSignInKey = GlobalKey<FormState>();
   bool rememberPassword = true;
  @override
  Widget build(BuildContext context) {
    return  CustomScaffold(
      
      child: Column(
        children: [
          const Column(
            children: [
              Text('Deliver features faster'),
            ],
          ),
          const Column(
            children: [
              Text('Deliver features faster'),
            ],
          ),
          const Expanded(
            flex: 1,
            child: SizedBox(
              height: 10,
            ),
          ),
          Expanded(
            flex: 5,
            child: Container(
              padding: const EdgeInsets.fromLTRB(25.0, 50.0, 25.0, 20.0),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40.0),
                    topRight: Radius.circular(40.0),
                    ),
                  ),
            child: SingleChildScrollView(
              child: Form(
                key: _formSignInKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
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
                      // validator: (value) {
                      //   if (value == null || value.isEmpty) {
                      //     return 'โปรดเลขทะเบียนสมาชิก 10 หลัก';
                      //   }
                      //   return null;
                      // },
                      decoration: InputDecoration(
                        focusedBorder: const OutlineInputBorder(borderSide: BorderSide(color: Color.fromARGB(255, 14, 53, 15))),
                        label: const Text('เลขทะเบียนสมาชิก 10 หลัก'),
                        labelStyle: const TextStyle(color: Color.fromARGB(255, 14, 53, 15)),
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
                    ),
                    const SizedBox(
                      height: 25.0,
                    ),
                    TextFormField(
                      obscureText: true,
                      obscuringCharacter: '*',
                      // validator: (value) {
                      //   if (value == null || value.isEmpty) {
                      //     return 'โปรดกรอกรหัสผ่าน';
                      //   }
                      //   return null;
                      // },
                      decoration: InputDecoration(
                        focusedBorder: const OutlineInputBorder(borderSide: BorderSide(color: Color.fromARGB(255, 14, 53, 15))),
                        label: const Text('รหัสผ่าน'),
                        labelStyle: const TextStyle(color: Color.fromARGB(255, 14, 53, 15)),
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
                          if (_formSignInKey.currentState!.validate() &&
                            rememberPassword) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Processing Data'),
                                ),
                              );
                            }else if (!rememberPassword) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text(
                                    'Please agree to the processing of personal data'
                                  )
                                ),
                              );
                            }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color.fromARGB(255, 14, 53, 15),
                          padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                        ),
                        child: const Text('เข้าสู่ระบบ',
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
                            'ลงทะเบียนที่นี่',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 14, 53, 15),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                  ],
              )),
            ),),
          ),
          
        ],
      ),
    );
  }
}