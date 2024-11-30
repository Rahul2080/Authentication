import 'package:authentication/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Home extends StatefulWidget {
  final String Email;

  const Home({super.key, required this.Email});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text(
          'Welcome  Screen',
          style: TextStyle(fontSize: 22.sp, color: Colors.white),
        ),
      ),
      body: Center(
        child: Text(
          widget.Email,
          style: TextStyle(fontSize: 30.sp, color: Colors.black),
        ),
      ),
    );
  }
}
