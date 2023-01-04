// import 'dart:convert';
//
// import 'package:flutter/gestures.dart';
// import 'package:flutter/material.dart';
// import 'package:mart_bag/models/data_class.dart';
// import 'package:provider/provider.dart';
// import 'package:mart_bag/constants/constants.dart';
// import 'package:mart_bag/models/signup_model.dart';
// import 'package:mart_bag/controls/network_handler.dart';
// import 'package:mart_bag/views/auth/login_screen/login_screen.dart';
// import 'package:mart_bag/views/home_screen/home_screen.dart';
// import 'package:mart_bag/widgets/screens_background.dart';
// import 'package:mart_bag/widgets/text_input.dart';
// import 'package:intl_phone_field/intl_phone_field.dart';
//
// class SignUpScreen extends StatefulWidget {
//   const SignUpScreen({Key? key}) : super(key: key);
//
//   @override
//   State<SignUpScreen> createState() => _SignUpScreenState();
// }
//
// class _SignUpScreenState extends State<SignUpScreen> {
//   NetworkHandler networkHandler = NetworkHandler();
//
//   TextEditingController nameController = TextEditingController();
//   TextEditingController phoneController = TextEditingController();
//   TextEditingController addressController = TextEditingController();
//   TextEditingController emailController = TextEditingController();
//   TextEditingController passwordController = TextEditingController();
//
//   Future<void> _registration() async {
//     String name = nameController.text.trim();
//     String address = addressController.text.trim();
//     String phone = phoneController.text.trim();
//     String email = emailController.text.trim();
//     String password = passwordController.text.trim();
//     SignUpBody signUpBody = SignUpBody(
//         name: name, address: address, phone: phone, email: email, password: password);
//     var provider = Provider.of<DataClass>(context, listen: false);
//     await provider.postData(signUpBody);
//     if (provider.isBack) {
//       nextScreen(context, const HomeScreen());
//     }
//   }
//
//   final formKey = GlobalKey<FormState>();
//   String email = "";
//   String password = "";
//   String name = "";
//   String address = "";
//   String phone = "";
//   String countryDial = "+1";
//   bool _isLoading = false;
//
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//   }
//
//
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: (){
//         FocusScope.of(context).unfocus();
//       },
//       child: Stack(
//         children: [
//           backgroundImage1(),
//           Scaffold(
//             backgroundColor: Colors.transparent,
//             body: SafeArea(
//               child: Column(
//                 children: [
//                   Expanded(
//                     child: SingleChildScrollView( //To control overflow using SingleChildScrollView
//                       child: Padding(
//                         padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 80.0),
//                         child: Form(
//                           key: formKey,
//                           child: Column(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             crossAxisAlignment: CrossAxisAlignment.center,
//                             children: <Widget>[
//                               const Text(
//                                 "MartBag",
//                                 style: TextStyle(
//                                   fontSize: 40.0,
//                                   color: Colors.green,
//                                   fontWeight: FontWeight.bold,
//                                   fontFamily: "Signatra",
//                                 ),
//                               ),
//
//                               const SizedBox(height: 10.0,),
//
//                               const Text(
//                                 "SignUp to MartBag",
//                                 style: TextStyle(
//                                   fontSize: 30.0, fontWeight: FontWeight.w400, fontFamily: "Varela",
//                                   color: Colors.white,
//                                 ),
//                               ),
//                               // const SizedBox(height: 20.0,),
//                               // Image.asset("images/seller.png", scale: 2.5,),
//
//                               const SizedBox(height: 20.0,),
//
//                               TextFormField(
//                                 controller: nameController,
//                                 decoration: textInputDecoration.copyWith(
//                                   labelText: "Full Name",
//                                   prefixIcon: Icon(Icons.person, color: lightIconsColor,),
//                                 ),
//                                 onChanged: (value) {
//                                   setState(() {
//                                     name = value;
//                                   });
//                                 },
//                                 validator: (value) {
//                                   if(value!.isNotEmpty){
//                                     return null;
//                                   }else{
//                                     return "Name can not be empty";
//                                   }
//                                 },
//                               ),
//
//                               const SizedBox(height: 15.0,),
//
//                               TextFormField(
//                                 controller: addressController,
//                                 decoration: textInputDecoration.copyWith(
//                                   labelText: "Address",
//                                   prefixIcon: Icon(Icons.location_on_sharp, color: lightIconsColor,),
//                                 ),
//                                 onChanged: (value) {
//                                   setState(() {
//                                     address = value;
//                                   });
//                                 },
//                                 validator: (value) {
//                                   if(value!.isNotEmpty){
//                                     return null;
//                                   }else{
//                                     return "Address can not be empty";
//                                   }
//                                 },
//                               ),
//
//                               const SizedBox(height: 15.0,),
//
//                               // Text input field for phoneNumber
//                               IntlPhoneField(
//                                 controller: phoneController,
//                                 showCountryFlag: false,
//                                 showDropdownIcon: false,
//                                 initialValue: phone,
//                                 onCountryChanged: (country) {
//                                   setState(() {
//                                     phone = "+${country.dialCode}";
//                                   });
//                                 },
//                                 decoration: textInputDecoration.copyWith(
//                                   labelText: "Phone Number",
//                                   prefixIcon: Icon(Icons.phone_android_rounded, color: lightIconsColor,),
//                                 ),
//                                 validator: (value) {
//                                   if(phone.isNotEmpty){
//                                     return null;
//                                   }else{
//                                     return "Provide your phone number";
//                                   }
//                                 },
//                               ),
//
//                               const SizedBox(height: 15.0,),
//
//                               TextFormField(
//                                 controller: emailController,
//                                 decoration: textInputDecoration.copyWith(
//                                   labelText: "Email",
//                                   prefixIcon: Icon(Icons.email_rounded, color: lightIconsColor,),
//                                 ),
//                                 onChanged: (value) {
//                                   setState(() {
//                                     email = value;
//                                     print(email);
//                                   });
//                                 },
//                                 validator: (value) {
//                                   return RegExp(
//                                       r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
//                                       .hasMatch(value!)
//                                       ? null
//                                       : "Please enter a valid email";
//                                 },
//                               ),
//                               const SizedBox(height: 15.0,),
//
//                               TextFormField(
//                                 controller: passwordController,
//                                 obscureText: true,
//                                 decoration: textInputDecoration.copyWith(
//                                   labelText: "Password",
//                                   prefixIcon: Icon(Icons.lock, color: lightIconsColor,),
//                                 ),
//                                 onChanged: (value) {
//                                   setState(() {
//                                     password = value;
//                                     print(password);
//                                   });
//                                 },
//                                 validator: (value) {
//                                   if (value!.length < 6) {
//                                     return "Password must be at least 6 characters";
//                                   } else {
//                                     return null;
//                                   }
//                                 },
//                               ),
//                               const SizedBox(
//                                 height: 20,
//                               ),
//                               SizedBox(
//                                 width: double.infinity,
//                                 child: ElevatedButton(
//                                   style: ElevatedButton.styleFrom(
//                                       backgroundColor: lightEnabledColor,
//                                       elevation: 0,
//                                       shape: RoundedRectangleBorder(
//                                           borderRadius: BorderRadius.circular(30))),
//                                   child: const Text(
//                                     "Sign Up",
//                                     style:
//                                     TextStyle(color: Colors.white, fontSize: 16),
//                                   ),
//                                   onPressed: () {
//                                     signUp();
//                                     // _registration();
//                                     print("tapped");
//                                     networkHandler.postData();
//                                   },
//                                 ),
//                               ),
//                               const SizedBox(
//                                 height: 10,
//                               ),
//                               Text.rich(TextSpan(
//                                 text: "Already have an account? ",
//                                 style: const TextStyle(
//                                     color: Colors.white, fontSize: 14),
//                                 children: <TextSpan>[
//                                   TextSpan(
//                                       text: "Login",
//                                       style: TextStyle(
//                                           color: lightEnabledColor,
//                                           decoration: TextDecoration.underline),
//                                       recognizer: TapGestureRecognizer()
//                                         ..onTap = () {
//                                           nextScreen(context, const LoginScreen());
//                                         }
//                                   ),
//                                 ],
//                               )),
//                             ],
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   signUp() async{
//     if (formKey.currentState!.validate()) {
//       setState(() {
//          networkHandler.postData;
//       });
//       nextScreen(context, const HomeScreen());
//       // if(body){
//       //   nextScreen(context, const HomeScreen());
//       // }
//       //
//       // var data = {
//       //   "name": nameController.text,
//       //   "phone": phoneController,
//       //   "address": addressController,
//       //   "email": emailController,
//       //   "password": passwordController,
//       // };
//       //
//       // var res = NetworkHandler().postData(data, 'signUp');
//       // var body = json.decode(res.body);
//     }
//   }
// }





import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:mart_bag/models/data_class.dart';
import 'package:provider/provider.dart';
import 'package:mart_bag/constants/constants.dart';
import 'package:mart_bag/models/signup_model.dart';
import 'package:mart_bag/controls/network_handler.dart';
import 'package:mart_bag/views/auth/login_screen/login_screen.dart';
import 'package:mart_bag/views/home_screen/home_screen.dart';
import 'package:mart_bag/widgets/screens_background.dart';
import 'package:mart_bag/widgets/text_input.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  NetworkHandler networkHandler = NetworkHandler();

  final formKey = GlobalKey<FormState>();
  dynamic name;
  dynamic email;
  dynamic password;
  dynamic phone;
  dynamic address;

  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();



  // Function to send the POST request
  Future<String> submit() async {
    try{
    var url = 'https://monthly-grocery-schedule-backend.onrender.com/api/v1/mart-bag/users/signup';
    var response = await http.post(Uri.parse(url), body: {
      'name': name,
      'address': address,
      'phone': phone,
      'email': email,
      'password': password,
    });

    if(response.statusCode == 200) {
      print(response.body);
      return response.body;
    }else{
      print(response.statusCode);
    }

    //String responseJson = response.body.toString();
    var data = jsonDecode(response.body);
    print(data.toString());

    return "success";
    // var responseJson = json.decode(response.body);
    // print(responseJson);
    //
    // return responseJson['status'];
    }catch(error){
      log("An error occured $error");
      throw error.toString();
    }
  }



  // final formKey = GlobalKey<FormState>();
  // String email = "";
  // String password = "";
  // String name = "";
  // String address = "";
  // String phone = "";
  String countryDial = "+1";
  bool _isLoading = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }


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
                                "SignUp to MartBag",
                                style: TextStyle(
                                  fontSize: 30.0, fontWeight: FontWeight.w400, fontFamily: "Varela",
                                  color: Colors.white,
                                ),
                              ),
                              // const SizedBox(height: 20.0,),
                              // Image.asset("images/seller.png", scale: 2.5,),

                              const SizedBox(height: 20.0,),

                              TextFormField(
                                controller: nameController,
                                decoration: textInputDecoration.copyWith(
                                  labelText: "Full Name",
                                  prefixIcon: Icon(Icons.person, color: lightIconsColor,),
                                ),
                                onChanged: (value) {
                                  setState(() {
                                    name = value;
                                  });
                                },
                                validator: (value) {
                                  if(value!.isNotEmpty){
                                    return null;
                                  }else{
                                    return "Name can not be empty";
                                  }
                                },
                              ),

                              const SizedBox(height: 15.0,),

                              TextFormField(
                                controller: addressController,
                                decoration: textInputDecoration.copyWith(
                                  labelText: "Address",
                                  prefixIcon: Icon(Icons.location_on_sharp, color: lightIconsColor,),
                                ),
                                onChanged: (value) {
                                  setState(() {
                                    address = value;
                                  });
                                },
                                validator: (value) {
                                  if(value!.isNotEmpty){
                                    return null;
                                  }else{
                                    return "Address can not be empty";
                                  }
                                },
                              ),

                              const SizedBox(height: 15.0,),

                              // Text input field for phoneNumber
                              IntlPhoneField(
                                controller: phoneController,
                                showCountryFlag: false,
                                showDropdownIcon: false,
                                initialValue: phone,
                                onCountryChanged: (country) {
                                  setState(() {
                                    phone = "+${country.dialCode}";
                                  });
                                },
                                decoration: textInputDecoration.copyWith(
                                  labelText: "Phone Number",
                                  prefixIcon: Icon(Icons.phone_android_rounded, color: lightIconsColor,),
                                ),
                                validator: (value) {
                                  if(phone.isNotEmpty){
                                    return null;
                                  }else{
                                    return "Provide your phone number";
                                  }
                                },
                              ),

                              const SizedBox(height: 15.0,),

                              TextFormField(
                                controller: emailController,
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
                                controller: passwordController,
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
                                    "Sign Up",
                                    style:
                                    TextStyle(color: Colors.white, fontSize: 16),
                                  ),
                                  onPressed: () {
                                    // Validate returns true if the form is valid, or false
                                    // otherwise.
                                    if (formKey.currentState!.validate()) {
                                      formKey.currentState!.save();
                                      // If the form is valid, submit the form
                                      submit();
                                      nextScreen(context, const HomeScreen());
                                    }
                                  },
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text.rich(TextSpan(
                                text: "Already have an account? ",
                                style: const TextStyle(
                                    color: Colors.white, fontSize: 14),
                                children: <TextSpan>[
                                  TextSpan(
                                      text: "Login",
                                      style: TextStyle(
                                          color: lightEnabledColor,
                                          decoration: TextDecoration.underline),
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () {
                                          nextScreen(context, const LoginScreen());
                                        }
                                  ),
                                ],
                              )),
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

}
