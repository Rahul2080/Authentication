import 'package:authentication/Bloc/SiginUp_Bloc/sign_up_bloc.dart';
import 'package:authentication/Repository/ModelClass/SignUpModel.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'Login.dart';

class Siginup extends StatefulWidget {
  const Siginup({super.key});

  @override
  State<Siginup> createState() => _SiginupState();
}

class _SiginupState extends State<Siginup> {

  TextEditingController namecontroller = TextEditingController();
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController statecontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  TextEditingController citycontroller = TextEditingController();
  TextEditingController localitycontroller = TextEditingController();
  late SignUpModel SignUpdata;
  final _formKey = GlobalKey<FormState>();
  bool _isObscured = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.center,
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 70.h),
                Text('Login',style: TextStyle(fontSize: 40.sp,color: Colors.green,fontWeight: FontWeight.w500),),
                SizedBox(height: 50.h),
                Center(
                  child: SizedBox(
                    width: 300.w,
                    child: TextFormField(
                      controller: namecontroller,
                      decoration: InputDecoration(
                        hintText: 'Full Name',
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
                        prefixIcon: const Icon(
                          Icons.person_outline,
                          color: Colors.green,
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your full name';
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
                        prefixIcon: const Icon(
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
                      controller: statecontroller,
                      decoration: InputDecoration(
                        hintText: 'State',
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
                        prefixIcon: const Icon(
                          Icons.place_outlined,
                          color: Colors.green,
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your state';
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
                      controller: citycontroller,
                      decoration: InputDecoration(
                        hintText: 'City',
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
                        prefixIcon: const Icon(
                          Icons.place_outlined,
                          color: Colors.green,
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your city';
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
                      controller: localitycontroller,
                      decoration: InputDecoration(
                        hintText: 'Locality',
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
                        prefixIcon: const Icon(
                          Icons.place_outlined,
                          color: Colors.green,
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your locality';
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
                        prefixIcon: const Icon(
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
                BlocListener<SignUpBloc, SignUpState>(
  listener: (context, state) {



    if (state is SignUBlocLoading) {
      print("loading");

      showDialog(
        context: context,
        builder: (BuildContext context) {
          return Center(child: CircularProgressIndicator(),);
        },
      );
    }
    if (state is SignUBlocLoaded) {
      SignUpdata= BlocProvider
          .of<SignUpBloc>(context).SignUp;

      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (_) => Login()),
              (route) => (false));
      // Navigator.of(context).pop();
    }
    if (state is SignUBlocError) {
      Navigator.of(context).pop();
      print('error');
    }
  },
  child: InkWell(
                  onTap: () {
                    if (_formKey.currentState!.validate()) {
                      BlocProvider.of<SignUpBloc>(context).add(FeatchSignUp(
                          name: namecontroller.text,
                          email: emailcontroller.text,
                          state: statecontroller.text,
                          password: passwordcontroller.text,
                          city: citycontroller.text,
                          locality: localitycontroller.text));
                    }


                    // Navigator.of(context).pushAndRemoveUntil(
                    //     MaterialPageRoute(builder: (_) => const Login()), (
                    //     route) => false);
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
                            .push(MaterialPageRoute(builder: (_) => const Login()));
                      },
                      child: Text(
                        'Sign In',
                        style: TextStyle(
                          color: Colors.green,
                          fontSize: 16.sp,
                          fontFamily: 'sf pro display',
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(height: 40.h,)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
