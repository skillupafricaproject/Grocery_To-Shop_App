import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_paystack/flutter_paystack.dart';
import 'package:mart_bag/constants/key.dart';

class MakePayment {
  MakePayment({this.ctx, this.price, this.email});

  BuildContext? ctx;

  int? price;

  String? email;

  PaystackPlugin plugin = PaystackPlugin();

  //Reference

  String _getReference() {
    String platform;
    if (Platform.isIOS) {
      platform = 'iOS';
    } else {
      platform = 'Android';
    }

    return 'ChargedFrom${platform}_${DateTime.now().millisecondsSinceEpoch}';
  }

  //GetUi
  PaymentCard _getCardUI() {
    return PaymentCard(number: "", cvc: "", expiryMonth: 0, expiryYear: 0);
  }

  Future initializePlugin() async {
    await plugin.initialize(publicKey: ConstantKey.PAYSTACK_KEY);
  }

  //Method Charging card
  chargeCardAndMakePayment() async {
    initializePlugin().then((_) async {
      Charge charge = Charge()
        ..amount = (price! * 100)
        ..email = email
        ..reference = _getReference()
        ..card = _getCardUI();

      CheckoutResponse response = await plugin.checkout(
        ctx!,
        charge: charge,
        method: CheckoutMethod.card,
        fullscreen: false,
        logo: const FlutterLogo(
          //if(_cardNumber == 16){
          //      return end => _digits
          // }else{
          //   initialize continue.
          // }
          size: 24,
        ),
      );

      print("Response $response");

      if (response.status == true) {
        print("Transaction successful");
      } else {
        print("Transaction failed");
      }
    });
  }
}