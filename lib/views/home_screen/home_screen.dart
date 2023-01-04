import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mart_bag/constants/constants.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:mart_bag/views/add_to_shop_list_screen/add_to_shop_list.dart';
import 'package:mart_bag/views/auth/login_screen/login_screen.dart';
import 'package:mart_bag/views/chat_screen/chat_screen.dart';
import 'package:mart_bag/views/payment_screen/payment1_screen.dart';
import 'package:mart_bag/views/payment_screen/paystack_payment_screen.dart';
import 'package:mart_bag/views/profile_screen/profile_screen.dart';
import 'package:mart_bag/views/store_screen/store_screen.dart';
import 'package:mart_bag/widgets/screens_background.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  int price = 0;

  String email = "iwuohacwilliams@yahoo.com";
  String title = "";
  String date = "";

  DateTime _date = DateTime.now();
  final List<String> items = <String>[];
  final List<dynamic> quantity = <dynamic>[];
  final DateFormat _dateFormatter = DateFormat("MMM dd yyyy");

  TextEditingController itemController = TextEditingController();
  TextEditingController quantityController = TextEditingController();
  TextEditingController _dateController = TextEditingController();

  void saveItemToList () {
    setState(() {
      items.insert(0, itemController.text);
      quantity.insert(0, quantityController.text);
      // quantity.insert(0, double.parse(quantityController.text));
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(
      children: [
        backgroundImage2(),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            // leading: IconButton(
            //   onPressed: (){},
            //   icon: const Icon(
            //     Icons.menu_rounded,
            //     color: Colors.white,
            //   ),
            // ),
            title: const Text(
              "Home", style: TextStyle(color: Colors.white),
            ),
            centerTitle: true,
            actions: [
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.notifications_sharp, color: Colors.white,),
              ),
            ],
          ),

          // Drawer Menu Area
          drawer: Drawer(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
              children: <Widget>[
                const Icon(
                  Icons.account_circle,
                  size: 150,
                  color: Colors.amber,
                ),
                const SizedBox(
                  height: 15,
                ),
                const Text(
                  "Williams Gozie",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20.0,
                      fontWeight: FontWeight.bold
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                const Divider(
                  height: 2,
                  thickness: 1.5,
                  color: Colors.grey,
                ),
                const SizedBox(
                  height: 10,
                ),

                ListTile(
                  onTap: () {},
                  //selectedColor: Theme.of(context).primaryColor,
                  selected: true,
                  contentPadding:
                  const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  leading: Icon(Icons.view_day_outlined, size: 30, color: lightEnabledColor,),
                  title: const Text(
                    "Daily",
                    style: TextStyle(color: Colors.black, fontSize: 16.0),
                  ),
                ),

                ListTile(
                  onTap: () {},
                  //selectedColor: Theme.of(context).primaryColor,
                  selected: true,
                  contentPadding:
                  const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  leading: Icon(Icons.view_week_outlined, size: 30, color: lightEnabledColor),
                  title: const Text(
                    "Weekly",
                    style: TextStyle(color: Colors.black, fontSize: 16.0),
                  ),
                ),

                ListTile(
                  onTap: () {},
                  //selectedColor: Theme.of(context).primaryColor,
                  selected: true,
                  contentPadding:
                  const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  leading: Icon(Icons.calendar_view_month_outlined, size: 30, color: lightEnabledColor),
                  title: const Text(
                    "Monthly",
                    style: TextStyle(color: Colors.black, fontSize: 16.0),
                  ),
                ),


                ListTile(
                  onTap: () {
                    nextScreen(context, Payment1Screen());
                    // Or we can make use of ->
                    // MakePayment(ctx: context, email: email, price: price)
                    //     .chargeCardAndMakePayment();
                  },
                  //selectedColor: Theme.of(context).primaryColor,
                  selected: true,
                  contentPadding:
                  const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  leading: Icon(Icons.payment_rounded, size: 30, color: lightEnabledColor),
                  title: const Text(
                    "Payment",
                    style: TextStyle(color: Colors.black, fontSize: 16.0),
                  ),
                ),


                const Divider(
                  height: 2,
                  thickness: 1.5,
                  color: Colors.grey,
                ),
                const SizedBox(
                  height: 10,
                ),


                ListTile(
                  onTap: () {
                    // nextScreen(context, const HomeScreen());
                    nextScreen(context, const ProfileScreen());
                  },
                  //selectedColor: Theme.of(context).primaryColor,
                  selected: true,
                  contentPadding:
                  const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  leading: Icon(Icons.manage_accounts_outlined, size: 30, color: lightEnabledColor),
                  title: const Text(
                    "Profile & Settings",
                    style: TextStyle(color: Colors.black, fontSize: 16.0),
                  ),
                ),
                ListTile(
                  onTap: () {
                    nextScreen(context, const ChatScreen());
                  },
                  //selectedColor: Theme.of(context).primaryColor,
                  selected: true,
                  contentPadding:
                  const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  leading: Icon(Icons.help_outline_sharp, size: 30, color: lightEnabledColor),
                  title: const Text(
                    "Help & feedback",
                    style: TextStyle(color: Colors.black, fontSize: 16.0),
                  ),
                ),


                const Divider(
                  height: 2,
                  thickness: 1.5,
                  color: Colors.grey,
                ),
                const SizedBox(
                  height: 10,
                ),

                ListTile(
                  onTap: () {
                    nextScreenReplace(context, const LoginScreen());
                  },
                  //selectedColor: Theme.of(context).primaryColor,
                  selected: true,
                  contentPadding:
                  const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  leading: Icon(Icons.power_settings_new_rounded, size: 30, color: lightErrorColor),
                  title: const Text(
                    "Sign Out",
                    style: TextStyle(color: Colors.black, fontSize: 16.0),
                  ),
                ),


              ],
            ),
          ),
          body: SafeArea(
            child: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 40.0),
                      child: ListView.builder(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        itemCount: items.length,
                        itemBuilder: (BuildContext context, int index) {
                          return shopListCards();
                        }
                      ),
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
                  child: const Icon(Icons.add_business_rounded, color: Colors.white,),
                  label: 'Stores',
                  labelStyle: TextStyle(
                      color: lightEnabledColor,
                      fontWeight: FontWeight.bold
                  ),
                  backgroundColor: lightFocusedColor,
                  onTap: () {
                    nextScreen(context, const StoreScreen());
                  },
                ),
              ]
          ),
        ),
      ],
    );
  }


  Widget shopListCards() {
    return Center(
      child: Container(
        height: 150,
        child: Card(
          color: lightEnabledColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          borderOnForeground: false,
          elevation: 10,
          child: ListTile(
            title: Padding(
              padding: const EdgeInsets.only(top: 20, bottom: 30.0),
              child: Text(title, style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),),
            ),
            subtitle: Text("Subtitle", style: TextStyle(
                color: Colors.white
            ),),
            trailing: Text("Trailing", style: TextStyle(
                color: Colors.white
            ),),
          ),
        ),
      ),
    );
  }

}
