import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  late final emailController = TextEditingController();
  final passwordController = TextEditingController();
  
  final obscurePassword = true.obs;
  final isLoading = false.obs;

  void togglePasswordVisibility() {
    obscurePassword.value = !obscurePassword.value;
  }

  Future<void> login() async {
    if (emailController.text.isEmpty || passwordController.text.isEmpty) {
      return;
    }

    isLoading.value = true;
    
    // Simulasi proses login
    await Future.delayed(const Duration(seconds: 1));
    
    isLoading.value = false;
    
    // Navigate to profile
    Get.offAllNamed('/profile');
  }

  void loginWithGoogle() {
  }

  void loginWithFacebook() {
  }

  void forgotPassword() {
  }

  void goToSignUp() {
    Get.offAllNamed('/signup');
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}