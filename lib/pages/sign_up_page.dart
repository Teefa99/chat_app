import 'package:chat_app/constants/constants.dart';
import 'package:chat_app/helpers/show_snack_bar.dart';
import 'package:chat_app/widgets/custom_button.dart';
import 'package:chat_app/widgets/custom_text_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class SignUpPage extends StatefulWidget {
  SignUpPage({super.key});

  static String id = 'SignUpPage';

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  String? email;

  String? password;

  GlobalKey<FormState> formKey = GlobalKey();

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        backgroundColor: kPrimaryColor,
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: Form(
            key: formKey,
            child: ListView(
              physics: BouncingScrollPhysics(),
              children: [
                SizedBox(
                  height: 80,
                ),
                Container(
                  height: 100,
                  child: Image.asset('assets/images/scholar.png'),
                ),
                Text(
                  'Scholar Chat',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontFamily: 'Pacifico',
                      fontSize: 32,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 60,
                ),
                Container(
                  width: double.infinity,
                  child: Text(
                    'Register',
                    style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w700,
                        color: Colors.white),
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                CustomTextField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email address.';
                    }

                    String pattern =
                        r'^[\w-]+(\.[\w-]+)*@([a-zA-Z0-9-]+\.)+[a-zA-Z]{2,7}$';
                    RegExp regex = RegExp(pattern);

                    if (!regex.hasMatch(value)) {
                      return 'Please enter a valid email address.';
                    }
                    return null;
                  },
                  onChanged: (data) {
                    email = data;
                  },
                  hintText: 'Email',
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomTextField(
                  obsecureText: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your password.';
                    }

                    if (value.length < 8) {
                      return 'Password should be at least 8 characters long.';
                    }

                    // Password strength evaluation logic
                    // You can modify this logic based on your requirements
                    bool hasUppercase = value.contains(RegExp(r'[A-Z]'));
                    bool hasLowercase = value.contains(RegExp(r'[a-z]'));
                    bool hasDigits = value.contains(RegExp(r'[0-9]'));
                    bool hasSpecialCharacters =
                        value.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'));

                    if (!(hasUppercase &&
                        hasLowercase &&
                        hasDigits &&
                        hasSpecialCharacters)) {
                      showSnackBar(context,
                          'Password should be strong and include at least one uppercase letter, one lowercase letter, one digit, and one special character.');
                      return 'password is weak';
                    }

                    return null;
                  },
                  onChanged: (data) {
                    password = data;
                  },
                  hintText: 'Password',
                ),
                const SizedBox(
                  height: 30,
                ),
                CustomButton(
                  onTap: () async {
                    if (formKey.currentState!.validate()) {
                      isLoading = true;
                      setState(() {});
                      try {
                        await registerUser();
                        showSnackBar(context, 'Email Successfully Created');
                        Navigator.pop(context);
                      } on FirebaseAuthException catch (e) {
                        if (e.code == 'weak-password') {
                          showSnackBar(
                              context, 'Weak password please change it');
                        } else if (e.code == 'email-already-in-use') {
                          showSnackBar(context, 'Email already exists');
                        }
                      } catch (e) {
                        showSnackBar(context, 'There was an error');
                      }
                      isLoading = false;
                      setState(() {});
                    }
                  },
                  text: 'Sign Up',
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Already have an account?',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        'Login',
                        style: TextStyle(
                          fontSize: 19,
                          color: Colors.greenAccent,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 100,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> registerUser() async {
    UserCredential userCredential = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email!, password: password!);
  }
}
