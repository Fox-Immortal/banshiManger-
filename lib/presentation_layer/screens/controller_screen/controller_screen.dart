import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:panshimanager/constant/my_colors.dart';
import 'package:panshimanager/data_layer/web_services/prepered_data/firebase_firestore_services.dart';
import 'package:panshimanager/presentation_layer/screens/sub_controller_screens/items_screen/items_screen.dart';
import 'package:panshimanager/presentation_layer/screens/sub_controller_screens/order_screen/order_screen.dart';


class ControllerScreen extends StatefulWidget {
  const ControllerScreen({Key? key}) : super(key: key);

  @override
  _ControllerScreenState createState() => _ControllerScreenState();
}

class _ControllerScreenState extends State<ControllerScreen> {
  int value = 0;
  int currentScreen = 0;
  int lastIndex = -1;
  final Color selectedColor = MyColors.myOrange;
  final List<Widget> _children = [
    const OrderScreen(),
    const ItemsScreen()
  ];
  void onItemTapped(int index) {
    setState(() {
      value = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: MyColors.myWhite,
      appBar: AppBar(
        backgroundColor: MyColors.myBlack,
        elevation: 0,
        centerTitle: true,
        title: Container(
          width: width * 0.3,
          height: height * 0.06,
          decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/panshiLogo2.png"),
              )),
        ),

      ),
      bottomNavigationBar: SizedBox(
        child: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.shopping_cart), label: "Orders"),
            BottomNavigationBarItem(
                icon: Icon(Icons.category), label: "Items"),
          ],
          backgroundColor: MyColors.myBlack,
          elevation: 0,
          type: BottomNavigationBarType.fixed,
          currentIndex: value,
          unselectedItemColor: MyColors.myWhite,
          selectedItemColor: selectedColor,
          onTap: onItemTapped,
        ),
      ),
        body: _children[value]
    );
  }
}


