import 'package:auth_app_with_api/core/componant/face_google_buttons.dart';
import 'package:auth_app_with_api/core/componant/main_button.dart';
import 'package:auth_app_with_api/logic/auth_cubit/auth_cubit.dart';
import 'package:auth_app_with_api/screens/home_screen.dart';
import 'package:auth_app_with_api/screens/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 20,
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 100),
              Text(
                "Log into \nyour account",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 30),
              TextFormField(
                controller: emailController,
                decoration: InputDecoration(
                  hintText: "Email address",
                ),
              ),
              SizedBox(height: 30),
              TextFormField(
                controller: passwordController,
                decoration: InputDecoration(
                  hintText: "Password",
                ),
              ),
              SizedBox(height: 30),
              Align(
                alignment: Alignment.topRight,
                child: TextButton(
                  onPressed: () {},
                  child: Text("Forget Password?"),
                ),
              ),
              SizedBox(height: 20),
              Center(
                child: Column(
                  children: [
                    BlocConsumer<AuthCubit, AuthState>(
                      builder: (context, state) {
                        AuthCubit cubit = AuthCubit.get(context);
                        return state is LoginLoading
                            ? const Center(child: CircularProgressIndicator())
                            : MainButton(
                                text: "Login",
                                onPress: () {
                                  cubit.login(
                                    email: emailController.text,
                                    password: passwordController.text,
                                  );
                                },
                              );
                      },
                      listener: (context, state) {
                        if (state is LoginSuccess) {
                          Navigator.pushReplacement(context,
                              MaterialPageRoute(builder: (c) => HomeScreen()));
                        } else if (state is LoginError) {
                          SnackBar snackBar =
                              const SnackBar(content: Text("Error"));
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        }
                      },
                    ),
                    SizedBox(height: 20),
                    Text("Or Login With"),
                    SizedBox(height: 20),
                    FaceAndGoogleButtons(),
                    SizedBox(height: 200),
                    TextButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return RegisterScreen();
                            },
                          ),
                        );
                      },
                      child: Text(
                        "Don’t have an account? Register",
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
