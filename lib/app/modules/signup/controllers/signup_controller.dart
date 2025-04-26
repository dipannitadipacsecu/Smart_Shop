import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupController extends GetxController {
  //TODO: Implement SignupController

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final FirebaseAuth _auth = FirebaseAuth.instance;
  
  RxBool isLoading = false.obs;

  void signup() async {
  final name = nameController.text;
  final email = emailController.text;
  final password = passwordController.text;

  if (name.trim().isEmpty || email.trim().isEmpty || password.trim().isEmpty) {
    Get.snackbar('Error', 'All fields are required');
    return;
  }

  try {
    isLoading.value = true;

    final userCredential = await _auth.createUserWithEmailAndPassword(
      email: email.trim(),
      password: password,
    );

    await userCredential.user?.updateDisplayName(name.trim());

    Get.snackbar('Success', 'Signup successful');
    Get.offAllNamed('/login');
  } on FirebaseAuthException catch (e) {
    Get.snackbar('Signup Failed', e.message ?? 'Unknown error');
  } finally {
    isLoading.value = false;
  }
}

}
