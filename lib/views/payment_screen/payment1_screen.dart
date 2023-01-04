import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'dart:async';
import 'dart:io';

class Payment1Screen extends StatefulWidget {

  @override
  State<Payment1Screen> createState() => _Payment1ScreenState();
}

class _Payment1ScreenState extends State<Payment1Screen> {

  @override
  void initState() {
    super.initState();
    // Enable virtual display.
    if (Platform.isAndroid) WebView.platform = AndroidWebView();
  }

  final Completer<WebViewController> _controller =
  Completer<WebViewController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "PayStack Payment",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Builder(builder: (BuildContext context){
          return WebView(
            initialUrl: 'https://paystack.com/pay/martbag',
            javascriptMode: JavascriptMode.unrestricted,
            onWebViewCreated: (WebViewController webViewController){
              _controller.complete(webViewController);
            },
            onProgress: (int progress){
              print("progress $progress%");
            },
            javascriptChannels: <JavascriptChannel>{
              _toasterJavascriptChannel(context)
            },
          );
        },),
      ),
    );

  }

  JavascriptChannel _toasterJavascriptChannel(BuildContext context){
    return JavascriptChannel(
        name: 'Toaster',
        onMessageReceived: (JavascriptMessage message){
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content:Text(message.message)),
          );
        }
    );
  }

}