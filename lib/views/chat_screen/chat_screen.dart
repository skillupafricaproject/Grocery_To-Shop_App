import 'dart:async';
import 'package:flutter/material.dart';
import 'package:mart_bag/views/store_screen/store_screen.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:mart_bag/constants/constants.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:mart_bag/views/add_to_shop_list_screen/add_to_shop_list.dart';
import 'package:mart_bag/views/home_screen/home_screen.dart';
import 'package:mart_bag/views/profile_screen/profile_screen.dart';
import 'package:mart_bag/widgets/screens_background.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final String title = "Online Agent";
  final String selectedUrl = "";

  final Completer<WebViewController> _controller = Completer<WebViewController>();

  int position = 1;
  final key = UniqueKey();

  doneLoading(String A) {
    setState(() {
      position = 0;
    });
  }

  startLoading(String A) {
    setState(() {
      position = 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Live Chat",
      home: Stack(
        children: [
          backgroundImage2(),
          Scaffold(
              backgroundColor: Colors.transparent,
              appBar: AppBar(
                backgroundColor: Colors.transparent,
                title: const Text(
                  "Live Chat", style: TextStyle(
                    color: Colors.white,
                  fontSize: 20,
                ),
                ),
                centerTitle: true,
              ),
              body: IndexedStack(
                index: position,
                children: <Widget>[
                  WebView(
                    initialUrl: "https://tawk.to/chat/638bb6f6daff0e1306dac877/1gjcs5d8v",
                    javascriptMode: JavascriptMode.unrestricted,
                    key: key,
                    onPageStarted: startLoading,
                    onPageFinished: doneLoading,
                  ),
                  Container(
                    color: Colors.white,
                    child: const Center(
                      child: CircularProgressIndicator(),
                    ),
                  ),
                ],
              ),

              //FLoating Action Button Section
            floatingActionButton: SpeedDial(
                animatedIcon: AnimatedIcons.add_event,
                icon: Icons.add,
                backgroundColor: lightEnabledColor,
                children: [
                  SpeedDialChild(
                    child: const Icon(Icons.add_business_rounded, color: Colors.white,),
                    label: 'Store',
                    labelStyle: TextStyle(
                        color: lightEnabledColor,
                        fontWeight: FontWeight.bold
                    ),
                    backgroundColor: lightFocusedColor,
                    onTap: () {
                      nextScreen(context, const StoreScreen());
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
      ),
    );
  }
}