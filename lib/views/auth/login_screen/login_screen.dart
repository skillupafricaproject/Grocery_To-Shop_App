import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:mart_bag/constants/constants.dart';
import 'package:mart_bag/views/auth/forgot_password_screen/forgot_password_screen.dart';
import 'package:mart_bag/views/auth/sign_up_screen/sign_up_screen.dart';
import 'package:mart_bag/views/home_screen/home_screen.dart';
import 'package:mart_bag/widgets/screens_background.dart';
import 'package:mart_bag/widgets/text_input.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();
  String email = "";
  String password = "";
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        FocusScope.of(context).unfocus();
      },
      child: Stack(
        children: [
          backgroundImage1(),
          Scaffold(
            backgroundColor: Colors.transparent,
            body: SafeArea(
              child: Column(
                children: [
                Expanded(
                  child: SingleChildScrollView( //To control overflow using SingleChildScrollView
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 80.0),
                          child: Form(
                            key: formKey,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                const Text(
                                  "MartBag",
                                  style: TextStyle(
                                    fontSize: 40.0,
                                    color: Colors.green,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: "Signatra",
                                  ),
                                ),

                                const SizedBox(height: 10.0,),

                                const Text(
                                  "Login to MartBag",
                                  style: TextStyle(
                                    fontSize: 30.0, fontWeight: FontWeight.w400, fontFamily: "Varela",
                                    color: Colors.white,
                                  ),
                                ),
                                // const SizedBox(height: 20.0,),
                                // Image.asset("images/seller.png", scale: 2.5,),

                                const SizedBox(height: 200.0,),

                                TextFormField(
                                  decoration: textInputDecoration.copyWith(
                                    labelText: "Email",
                                    prefixIcon: Icon(Icons.email_rounded, color: lightIconsColor,),
                                  ),
                                  onChanged: (value) {
                                    setState(() {
                                      email = value;
                                      print(email);
                                    });
                                  },
                                  validator: (value) {
                                    return RegExp(
                                        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                        .hasMatch(value!)
                                        ? null
                                        : "Please enter a valid email";
                                  },
                                ),
                                const SizedBox(height: 15.0,),

                                TextFormField(
                                  obscureText: true,
                                  decoration: textInputDecoration.copyWith(
                                    labelText: "Password",
                                    prefixIcon: Icon(Icons.lock, color: lightIconsColor,),
                                  ),
                                  onChanged: (value) {
                                    setState(() {
                                      password = value;
                                      print(password);
                                    });
                                  },
                                  validator: (value) {
                                    if (value!.length < 6) {
                                      return "Password must be at least 6 characters";
                                    } else {
                                      return null;
                                    }
                                  },
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                SizedBox(
                                  width: double.infinity,
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor: lightEnabledColor,
                                        elevation: 0,
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(30))),
                                    child: const Text(
                                      "Sign In",
                                      style:
                                      TextStyle(color: Colors.white, fontSize: 16),
                                    ),
                                    onPressed: () {
                                      login();
                                    },
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text.rich(TextSpan(
                                  text: "Don't have an account? ",
                                  style: const TextStyle(
                                      color: Colors.white, fontSize: 14),
                                  children: <TextSpan>[
                                    TextSpan(
                                        text: "Register here",
                                        style: TextStyle(
                                            color: lightEnabledColor,
                                            decoration: TextDecoration.underline),
                                        recognizer: TapGestureRecognizer()
                                          ..onTap = () {
                                            nextScreenReplace(context, const SignUpScreen());
                                          }
                                    ),
                                  ],
                                )),

                                const SizedBox(height: 10.0,),

                                GestureDetector(
                                  child: Text(
                                    "Forgot Password?",
                                    style: TextStyle(
                                        color: lightEnabledColor,
                                        decoration: TextDecoration.underline
                                    ),
                                  ),
                                  onTap: (){
                                    nextScreen(context, const ForgotPasswordScreen());
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }


  //Validation Key
  login() {
    if (formKey.currentState!.validate()) {
      setState(() {

      });
      nextScreen(context, const HomeScreen());
    }
  }
}
