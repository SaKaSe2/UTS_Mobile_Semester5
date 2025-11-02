import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'screens/login/view/login_view.dart';
import 'screens/login/binding/login_binding.dart';
import 'screens/signup/view/signup_view.dart';
import 'screens/signup/binding/signup_binding.dart';
import 'screens/user_profile/view/user_profile_view.dart';
import 'screens/user_profile/binding/user_profile_binding.dart';

void main() {
  runApp(const CinemaApp());
}

class CinemaApp extends StatelessWidget {
  const CinemaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Cinema Booking',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: const Color(0xFF3E4B6B),
        scaffoldBackgroundColor: Colors.grey[300],
        fontFamily: 'Roboto',
      ),
      initialRoute: '/login',
      getPages: [
        GetPage(
          name: '/login',
          page: () => const LoginView(),
          binding: LoginBinding(),
        ),
        GetPage(
          name: '/signup',
          page: () => const SignUpView(),
          binding: SignUpBinding(),
        ),
        GetPage(
          name: '/profile',
          page: () => const UserProfileView(),
          binding: UserProfileBinding(),
        ),
      ],
    );
  }
}