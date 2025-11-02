import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  
  final obscurePassword = true.obs;
  final isLoading = false.obs;

  void togglePasswordVisibility() {
    obscurePassword.value = !obscurePassword.value;
  }

  Future<void> login() async {
    if (emailController.text.isEmpty || passwordController.text.isEmpty) {
      Get.snackbar(
        'Error',
        'Please fill in all fields',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      return;
    }

    isLoading.value = true;
    
    // Simulasi proses login
    await Future.delayed(const Duration(seconds: 1));
    
    isLoading.value = false;
    
    // Navigate to profile
    Get.offAllNamed('/profile');
  }

  Future<void> loginWithGoogle() async {
    Get.snackbar(
      'Info',
      'Google login coming soon',
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  Future<void> loginWithFacebook() async {
    Get.snackbar(
      'Info',
      'Facebook login coming soon',
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  void forgotPassword() {
    Get.snackbar(
      'Info',
      'Forgot password feature coming soon',
      snackPosition: SnackPosition.BOTTOM,
    );
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