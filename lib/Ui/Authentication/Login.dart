import 'package:authentication/Bloc/Login_Bloc/login_bloc.dart';
import 'package:authentication/Repository/ModelClass/LoginModel.dart';
import 'package:authentication/Ui/Authentication/SiginUp.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../Home.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}
final _formKey = GlobalKey<FormState>();
bool _isObscured = true;

class _LoginState extends State<Login> {
  late LoginModel logindata;
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 200.h),
                Text('Login',style: TextStyle(fontSize: 40.sp,color: Colors.green,fontWeight: FontWeight.w500),),
                SizedBox(height: 50.h),
                Center(
                  child: SizedBox(
                    width: 300.w,
                    child: TextFormField(
                      controller: emailcontroller,
                      decoration: InputDecoration(
                        hintText: 'Email',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.r),
                          borderSide: BorderSide(color: Colors.red, width: 2.w),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.r),
                          borderSide: BorderSide(color: Colors.red, width: 2.w),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.r),
                          borderSide: const BorderSide(color: Colors.grey),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.r),
                          borderSide: BorderSide(
                              color: const Color(0xFF4CAF50), width: 2.w),
                        ),
                        prefixIcon: Icon(
                          Icons.email_outlined,
                          color: Colors.green,
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your email';
                        }
                        if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                          return 'Please enter a valid email';
                        }
                        return null;
                      },
                    ),
                  ),
                ),
                SizedBox(height: 20.h),
                Center(
                  child: SizedBox(
                    width: 300.w,
                    child: TextFormField(
                      controller: passwordcontroller,
                      obscureText: _isObscured,
                      decoration: InputDecoration(
                        hintText: 'Password',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.r),
                          borderSide: BorderSide(
                            color: const Color(0xFF4CAF50),
                            width: 2.w,
                          ),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.r),
                          borderSide: BorderSide(
                            color: Colors.red,
                            width: 2.w,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.r),
                          borderSide: const BorderSide(color: Colors.grey),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.r),
                          borderSide: BorderSide(
                            color: const Color(0xFF4CAF50),
                            width: 2.w,
                          ),
                        ),
                        suffixIcon: IconButton(
                          icon: Icon(
                            _isObscured
                                ? Icons.visibility_off
                                : Icons.visibility,
                            color: Colors.green,
                          ),
                          onPressed: () {
                            setState(() {
                              _isObscured = !_isObscured;
                            });
                          },
                        ),
                        prefixIcon: Icon(
                          Icons.lock_outline,
                          color: Colors.green,
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your password';
                        }
                        if (value.length < 6) {
                          return 'Password must be at least 6 characters';
                        }
                        return null;
                      },
                    ),
                  ),
                ),
                SizedBox(height: 20.h),
                BlocListener<LoginBloc, LoginState>(
  listener: (context, state) {


    if (state is LoginBlocLoading) {
      print("loading");

      showDialog(
        context: context,
        builder: (BuildContext context) {
          return Center(child: CircularProgressIndicator(),);
        },
      );
    }
    if (state is LoginBlocLoaded) {
      logindata= BlocProvider
          .of<LoginBloc>(context).login;

      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (_) => Home(Email: logindata.email.toString(),)),
              (route) => (false));
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(' Login SuccessFully')),
      );
      // Navigator.of(context).pop();

    }
    if (state is LoginBlocError) {
      Navigator.of(context).pop();
      print('error');
    }

  },
  child: InkWell(
                  onTap: () {
                    if (_formKey.currentState!.validate()) {
                      // If the form is valid, perform signup

                      BlocProvider.of<LoginBloc>(context).add(FeatchLogin(
                          email: emailcontroller.text,
                          password: passwordcontroller.text,
                         ));

                    }
                  },
                  child: Container(
                      width: 300.w,
                      height: 40.h,
                      decoration: ShapeDecoration(
                        color: Colors.green,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                            10.r,
                          ),
                        ),
                      ),
                      child: Center(
                          child: Text(
                            'Submit',
                            style: TextStyle(fontSize: 20.sp, color: Colors.white),
                          ))),
                ),
),
                SizedBox(
                  height: 40.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Have an account?',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16.sp,
                        fontFamily: 'sf pro display',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(width: 10.w),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (_) => Siginup()));
                      },
                      child: Text(
                        'Sign Up',
                        style: TextStyle(
                          color: Colors.green,
                          fontSize: 16.sp,
                          fontFamily: 'sf pro display',
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
