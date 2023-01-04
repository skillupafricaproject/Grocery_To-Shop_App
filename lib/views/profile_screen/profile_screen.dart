import 'package:flutter/material.dart';
import 'package:mart_bag/constants/constants.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:mart_bag/views/add_to_shop_list_screen/add_to_shop_list.dart';
import 'package:mart_bag/views/chat_screen/chat_screen.dart';
import 'package:mart_bag/views/home_screen/home_screen.dart';
import 'package:mart_bag/views/store_screen/store_screen.dart';
import 'package:mart_bag/widgets/screens_background.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        backgroundImage2(),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            title: const Text(
              "Profile", style: TextStyle(color: Colors.white),
            ),
            centerTitle: true,
          ),
          body: SafeArea(
            child: Column(
              children:  [
                Expanded(
                  child: SingleChildScrollView( //To control overflow using SingleChildScrollView
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 80.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          // TO DROP A CIRCLE IMAGE FOR THE PASSPORT
                          Center(
                            child: CircleAvatar(
                              backgroundColor: Colors.white,
                              //backgroundImage: AssetImage(''),
                              radius: 90.0,
                              child: Icon(
                                Icons.person,
                                size: 180,
                                color: lightFocusedColor,
                              ),
                            ),
                          ),
                          // PLACING A DIVIDER BETWEEN THE IMAGE AND NAME
                          const Divider(
                            height: 90.0,
                            thickness: 1.0,
                            color: Colors.white,
                          ),
                          const Text(
                            'NAME',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 2.0,
                            ),
                          ),
                          // HEIGHT BETWEEN TWO WIDGET FOR VERTICAL DISTANCE
                          const SizedBox(height: 10.0),
                          Text(
                            'Williams Gozie',
                            style: TextStyle(
                              color: Colors.amberAccent[200],
                              letterSpacing: 2.0,
                              fontSize: 28.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                          const SizedBox(height: 20.0),
                          // HEIGHT BETWEEN TWO WIDGET FOR VERTICAL DISTANCE
                          const Text(
                            'PHONE',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 2.0,
                            ),
                          ),
                          // HEIGHT BETWEEN TWO WIDGET FOR VERTICAL DISTANCE
                          const SizedBox(height: 10.0),
                          Text(
                            '09012345678',
                            style: TextStyle(
                              color: Colors.amberAccent[200],
                              letterSpacing: 2.0,
                              fontSize: 28.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          // // HEIGHT BETWEEN TWO WIDGET FOR VERTICAL DISTANCE
                          const SizedBox(height: 30.0),
                          Row(
                            children: <Widget>[
                              Icon(
                                Icons.email,
                                color: Colors.grey[400],
                              ),
                              // WIDTH BETWEEN TWO WIDGET FOR HORINZONTAL DISTANCE
                              const SizedBox(width: 10.0),
                              Text(
                                'iwuohacwilliams@yahoo.com',
                                style: TextStyle(
                                  color: Colors.grey[400],
                                  fontSize: 18.0,
                                  letterSpacing: 1.0,
                                ),
                              )
                            ],
                          ),

                          const SizedBox(height: 30.0),
                          Row(
                            children: <Widget>[
                              Icon(
                                Icons.location_on,
                                color: Colors.grey[400],
                              ),
                              // WIDTH BETWEEN TWO WIDGET FOR HORINZONTAL DISTANCE
                              const SizedBox(width: 10.0),
                              Text(
                                'Skillup Hub',
                                style: TextStyle(
                                  color: Colors.grey[400],
                                  fontSize: 18.0,
                                  letterSpacing: 1.0,
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}