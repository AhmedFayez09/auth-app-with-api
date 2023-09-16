import 'dart:developer';

import 'package:auth_app_with_api/core/componant/face_google_buttons.dart';
import 'package:auth_app_with_api/core/componant/main_button.dart';
import 'package:auth_app_with_api/logic/auth_cubit/auth_cubit.dart';
import 'package:auth_app_with_api/logic/dio_helper.dart';
import 'package:auth_app_with_api/screens/home_screen.dart';
import 'package:auth_app_with_api/screens/login_screen.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});
  TextEditingController nameC = TextEditingController();
  TextEditingController emailC = TextEditingController();
  TextEditingController passwordC = TextEditingController();
  TextEditingController phoneC = TextEditingController();
  GlobalKey<FormState> registerKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: SingleChildScrollView(
          child: Form(
            key: registerKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 100),
                Text(
                  "Create\nyour account",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                TextFormField(
                  controller: nameC,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please Enter Value";
                    }
                  },
                  decoration: InputDecoration(
                    hintText: "Enter your name",
                  ),
                ),
                SizedBox(height: 10),
                TextFormField(
                  controller: emailC,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please Enter Value";
                    } else if (!RegExp(
                            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                        .hasMatch(value)) {
                      return "Enter ex@gmail.com";
                    }
                  },
                  decoration: InputDecoration(
                    hintText: "Email address",
                  ),
                ),
                SizedBox(height: 10),
                TextFormField(
                  controller: passwordC,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please Enter Value";
                    }
                  },
                  decoration: InputDecoration(
                    hintText: "Password",
                  ),
                ),
                SizedBox(height: 10),
                TextFormField(
                  controller: phoneC,
                  keyboardType: TextInputType.phone,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please Enter Value";
                    }
                  },
                  decoration: InputDecoration(
                    hintText: "Phone",
                  ),
                ),
                SizedBox(height: 20),
                Center(
                  child: Column(
                    children: [
                      BlocConsumer<AuthCubit, AuthState>(
                        listener: (context, state) {
                          if (state is RegisterSuccessState) {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (c) => LoginScreen()));
                          } else if (state is RegisterErrorState) {
                            SnackBar snackBar =
                                const SnackBar(content: Text("Error"));
                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar);
                          }
                        },
                        builder: (context, state) {
                          AuthCubit cubit = AuthCubit.get(context);
                          return state is RegisterLoadingState
                              ? const Center(child: CircularProgressIndicator())
                              : MainButton(
                                  text: "SIGN UP",
                                  onPress: () {
                                    if (registerKey.currentState!.validate()) {
                                      cubit.register(
                                        userName: nameC.text,
                                        email: emailC.text,
                                        password: passwordC.text,
                                        phone: phoneC.text,
                                      );
                                    }
                                  },
                                );
                        },
                      ),
                      SizedBox(height: 20),
                      Text("Or Login With"),
                      SizedBox(height: 20),
                      FaceAndGoogleButtons(),
                      SizedBox(height: 200),
                      TextButton(
                        onPressed: () {
                          Navigator.pushAndRemoveUntil(context,
                              MaterialPageRoute(
                            builder: (context) {
                              return LoginScreen();
                            },
                          ), (route) => false);
                        },
                        child: Text("Already have account? Login"),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Dio dio = Dio();
}
