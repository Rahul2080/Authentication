import 'package:authentication/Bloc/Login_Bloc/login_bloc.dart';
import 'package:authentication/Bloc/SiginUp_Bloc/sign_up_bloc.dart';
import 'package:authentication/Ui/Authentication/Login.dart';
import 'package:authentication/Ui/Authentication/SiginUp.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        // Use builder only if you need to use library outside ScreenUtilInit context
        builder: (_, child) {
          return MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => SignUpBloc(),
              ),
              BlocProvider(
                create: (context) => LoginBloc(),
              ),
            ],
            child: MaterialApp(debugShowCheckedModeBanner: false,
              title: 'Flutter Demo',
              theme: ThemeData(
                colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
                useMaterial3: true,
              ),
              home: const Login(),
            ),
          );
        });
  }
}

