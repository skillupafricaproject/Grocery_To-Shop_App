import 'package:flutter/material.dart';
import 'package:mart_bag/constants/constants.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:mart_bag/views/add_to_shop_list_screen/add_to_shop_list.dart';
import 'package:mart_bag/views/chat_screen/chat_screen.dart';
import 'package:mart_bag/views/home_screen/home_screen.dart';
import 'package:mart_bag/views/profile_screen/profile_screen.dart';
import 'package:mart_bag/widgets/screens_background.dart';

class StoreScreen extends StatefulWidget {
  const StoreScreen({Key? key}) : super(key: key);

  @override
  State<StoreScreen> createState() => _StoreScreenState();
}

class _StoreScreenState extends State<StoreScreen> {
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
              "Stores", style: TextStyle(color: Colors.white),
            ),
            centerTitle: true,
          ),
          body: SafeArea(
            child: Column(
              children:const  [
                Expanded(
                  child: SingleChildScrollView( //To control overflow using SingleChildScrollView
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 80.0),
                      child: Center(child: Text("Home")),
                    ),
                  ),
                ),
              ],
            ),
          ),

          //FLoating Action Button Section
          floatingActionButton: SpeedDial(
              animatedIcon: AnimatedIcons.add_event,
              //icon: Icons.add,
              //backgroundColor: Colors.transparent,
              backgroundColor: lightEnabledColor,
              children: [
                SpeedDialChild(
                  child: const Icon(Icons.add_shopping_cart_rounded, color: Colors.white,),
                  label: 'Add Shop-List',
                  labelStyle: TextStyle(
                      color: lightEnabledColor,
                      fontWeight: FontWeight.bold
                  ),
                  backgroundColor: lightFocusedColor,
                  onTap: () {
                    nextScreen(context, const AddToShopListScreen());
                  },
                ),

                SpeedDialChild(
                  child: const Icon(Icons.home, color: Colors.white,),
                  label: 'Home',
                  labelStyle: TextStyle(
                      color: lightEnabledColor,
                      fontWeight: FontWeight.bold
                  ),
                  backgroundColor: lightFocusedColor,
                  onTap: () {
                    nextScreen(context, const HomeScreen());
                  },
                ),
              ]
          ),
        ),
      ],
    );
  }
}