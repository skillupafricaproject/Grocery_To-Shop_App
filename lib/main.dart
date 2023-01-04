import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mart_bag/constants/constants.dart';
import 'package:mart_bag/models/data_class.dart';
import 'package:provider/provider.dart';
import 'views/auth/login_screen/login_screen.dart';
import 'views/home_screen/home_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_)=>DataClass()),
  ],
      child: MyApp()));
}

class MyApp extends StatelessWidget {
  //final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // return FutureBuilder(
    //     future: _initialization,
    //     builder: (context, snapshot)
    //     {
    //       if(snapshot.connectionState == ConnectionState.waiting)
    //       {
    //         return const MaterialApp(
    //           debugShowCheckedModeBanner: false,
    //           home: Scaffold(
    //             body: Center(
    //               child: Center(
    //                 child: Text(
    //                     "Welcome to MartBag App"
    //                 ),
    //               ),
    //             ),
    //           ),
    //         );
    //       }
    //       else if(snapshot.hasError)
    //       {
    //         return const MaterialApp(
    //           debugShowCheckedModeBanner: false,
    //           home: Scaffold(
    //             body: Center(
    //               child: Center(
    //                 child: Text(
    //                     "An error occurred, Please wait..."
    //                 ),
    //               ),
    //             ),
    //           ),
    //         );
    //       }
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: "Mart Bag",
            theme: ThemeData(
            scaffoldBackgroundColor: lightBackgroundColor,
            primaryColor: lightCardColor,
            backgroundColor: lightBackgroundColor,
            appBarTheme: AppBarTheme(
              iconTheme: IconThemeData(
                color: lightIconsColor,
              ),
              backgroundColor: lightScaffoldColor,
              centerTitle: true,
              titleTextStyle: TextStyle(
                  color: lightTextColor, fontSize: 22.0, fontWeight: FontWeight.bold
              ),
              elevation: 8,
            ),
            iconTheme: IconThemeData(
                color: lightIconsColor
            ),
            textSelectionTheme: const TextSelectionThemeData(
              cursorColor: Colors.black,
              selectionColor: Colors.green,
            ),
          ),
            home: const LoginScreen(),
          );
        }
    //); future build close
  }
//} future build close