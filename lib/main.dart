import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:crud_api/dashboard/splash_screen.dart';
import 'package:crud_api/auth/role_selection_screen.dart';
import 'package:crud_api/auth/patient_login_screen.dart';
import 'package:crud_api/auth/patient_register_screen.dart';
import 'package:crud_api/auth/admin_login_screen.dart';
import 'package:crud_api/dashboard/home_screen.dart';

void main() {
  runApp(DevicePreview(
    builder: (context) => MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});



  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Medics',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF0D9488)),
        useMaterial3: true,
      ),
      initialRoute: '/home',
      routes: {
        '/splash': (context) => const SplashScreen(),
        '/role_selection': (context) => RoleSelectionScreen(),
        '/patient_login': (context) => PatientLoginScreen(),
        '/patient_register': (context) => PatientRegisterScreen(),
        '/admin_login': (context) => AdminLoginScreen(),
        '/home': (context) => HomeScreen(),
      },
    );
  }
}
