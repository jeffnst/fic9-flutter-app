// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';

import '../../common/constants/images.dart';
import 'login_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    Future.delayed(
      const Duration(milliseconds: 3000),
      () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const LoginPage(),
        ),
      ),
    );

    return Scaffold(
      body: Center(
          child: Image.asset(
        Images.logopanjang,
        width: 200,
        height: 200,
      )),
    );
  }
}
