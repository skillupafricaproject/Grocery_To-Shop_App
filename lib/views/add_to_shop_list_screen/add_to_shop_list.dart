import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_gradient_colors/flutter_gradient_colors.dart';
import 'package:mart_bag/constants/constants.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:mart_bag/models/shop_list.dart';
import 'package:mart_bag/views/chat_screen/chat_screen.dart';
import 'package:mart_bag/views/home_screen/home_screen.dart';
import 'package:mart_bag/views/profile_screen/profile_screen.dart';
import 'package:mart_bag/views/store_screen/store_screen.dart';
import 'package:mart_bag/widgets/screens_background.dart';
import 'package:mart_bag/widgets/text_input.dart';

class AddToShopListScreen extends StatefulWidget {
  const AddToShopListScreen({Key? key}) : super(key: key);

  @override
  State<AddToShopListScreen> createState() => _AddToShopListScreenState();
}

class _AddToShopListScreenState extends State<AddToShopListScreen> {
  final formKey = GlobalKey<FormState>();
  String title = "";
  String date = "";
  String _title = "";

  DateTime _date = DateTime.now();

  final List<String> items = <String>[];
  final List<dynamic> quantity = <dynamic>[];
  final DateFormat _dateFormatter = DateFormat("MMM dd yyyy");

  TextEditingController itemController = TextEditingController();
  TextEditingController quantityController = TextEditingController();
  TextEditingController _dateController = TextEditingController();



  // @override
  // void initState() {
  //   super.initState();
  //
  //   if (widget.note != null) {
  //     _title = widget.note!.title!;
  //     _date = widget.note!.date!;
  //
  //     setState(() {
  //       btnText = "Update Note";
  //       titleText = "Update Note";
  //     });
  //   } else {
  //     setState(() {
  //       btnText = "Add Note";
  //       titleText = "Add Note";
  //     });
  //   }
  //
  //   _dateController.text = _dateFormatter.format(_date);
  // }



  void addItemToList () {

    setState(() {
      items.insert(0, itemController.text);
      quantity.insert(0, quantityController.text);
      // quantity.insert(0, double.parse(quantityController.text));
    });
  }

  void saveItemToList () {
    setState(() {
      items.insert(0, itemController.text);
      quantity.insert(0, quantityController.text);
      // quantity.insert(0, double.parse(quantityController.text));
    });
  }

  @override
  void dispose() {
    _dateController.dispose();
    super.dispose();
  }


  //Calender Creating
  _handleDatePicker() async {
    final DateTime? date = await showDatePicker(
        context: context,
        initialDate: _date,
        firstDate: DateTime(2008),
        lastDate: DateTime(2100));

    if (date != null && date != _date) {
      setState(() {
        _date = date;
      });
      _dateController.text = _dateFormatter.format(date);
    }
  }

  //To Delete an Item
  void deleteItem () {
    setState(() {
      // items.removeWhere((element) => element.toString() == toString());
      // quantity.removeWhere((element) => element.toString() == toString());
      // items.removeAt(0);
      // quantity.removeAt(0);
      items.removeLast();
      quantity.removeLast();
    });
  }


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        FocusScope.of(context).unfocus();
      },
      child: Stack(
        children: [
          backgroundImage2(),
          Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              title: const Text(
                "Add To-Shop-List", style: TextStyle(color: Colors.white),
              ),
              centerTitle: true,
            ),
            body: SafeArea(
              child: Form(
                key: formKey,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          saveItemToList();
                          nextScreen(context, const HomeScreen());
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                              height: 40.0,
                              width: 100.0,
                              decoration: BoxDecoration(
                                gradient: const LinearGradient(
                                  colors: GradientColors.beautifulGreen
                                ),
                                color: lightEnabledColor,
                                borderRadius: BorderRadius.circular(16.0),
                              ),
                              child: const Center(
                                child: Text(
                                  "Save",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 15.0,),

                      Expanded(
                        child: ListView(
                          scrollDirection: Axis.vertical,
                          padding: const EdgeInsets.fromLTRB(10.0, 0, 10.0, 0),
                          children: [
                            //TextField for Title
                            TextFormField(
                              decoration: textInputDecoration.copyWith(
                                labelText: "Title",
                                //prefixIcon: Icon(Icons.person, color: lightIconsColor,),
                              ),
                              style: const TextStyle(
                                color: Colors.white,
                              ),
                              onChanged: (value) {
                                setState(() {
                                  title = value;
                                });
                              },
                              validator: (value) {
                                if(value!.isNotEmpty){
                                  return null;
                                }else{
                                  return "Title can not be empty";
                                }
                              },
                            ),

                            const SizedBox(height: 15.0,),

                            //TextField for Date
                            TextFormField(
                              decoration: textInputDecoration.copyWith(
                                labelText: "Date",
                                //prefixIcon: Icon(Icons.person, color: lightIconsColor,),
                              ),
                              style: const TextStyle(
                                color: Colors.white,
                              ),
                              onTap: _handleDatePicker,
                              readOnly: true,
                              controller: _dateController,
                              onChanged: (value) {
                                setState(() {
                                  date = value;
                                });
                              },
                              validator: (value) {
                                if(value!.isNotEmpty){
                                  return null;
                                }else{
                                  return "Date can not be empty";
                                }
                              },
                            ),

                            const SizedBox(height: 15.0,),

                            //TextField For The Add Item
                            TextFormField(
                              decoration: textInputDecoration.copyWith(
                                labelText: "Add Item",
                                //prefixIcon: Icon(Icons.person, color: lightIconsColor,),
                              ),
                              style: const TextStyle(
                                color: Colors.white,
                              ),
                              controller: itemController,
                              validator: (value) {
                                if(value!.isNotEmpty){
                                  return null;
                                }else{
                                  return "Item can not be empty";
                                }
                              },
                            ),

                            const SizedBox(height: 5.0,),


                            //TextField For The Quantity
                            TextFormField(
                              decoration: textInputDecoration.copyWith(
                                labelText: "Quantity",
                                //prefixIcon: Icon(Icons.person, color: lightIconsColor,),
                              ),
                              style: const TextStyle(
                                color: Colors.white,
                              ),
                              controller: quantityController,
                              validator: (value) {
                                if(value!.isNotEmpty){
                                  return null;
                                }else{
                                  return "quantity can not be empty";
                                }
                              },
                            ),

                          ],
                        ),
                      ),

                      const SizedBox(height: 25.0,),

                      ElevatedButton(
                        onPressed: () {
                          addItemToList();
                        },
                        child: const Text("Add"),
                      ),

                      Expanded(
                        child: ListView.builder(
                          padding: const EdgeInsets.all(8.0),
                          itemCount: items.length,
                          itemBuilder: (BuildContext context, int index){
                            return Container(
                              height: 60,
                              //margin: const EdgeInsets.all(1),
                              //color: lightFocusedColor,
                              color: Colors.white,
                              // color: quantity[index] >= 10
                              //     ? Colors.blue[400]
                              //     : quantity[index] > 3
                              //     ? Colors.blue[100] : Colors.grey,
                              child: Center(
                                child: Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(
                                        "${items[index]} (${quantity[index]})",
                                        style: const TextStyle(fontSize: 18.0),
                                      ),

                                      const Spacer(),

                                      IconButton(
                                        onPressed: (){
                                          deleteItem();
                                        },
                                        icon: Icon(
                                          Icons.delete_forever,
                                          color: lightErrorColor,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
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