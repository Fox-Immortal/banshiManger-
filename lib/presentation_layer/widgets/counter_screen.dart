import 'package:flutter/material.dart';
import 'package:panshimanager/presentation_layer/screens/sub_controller_screens/order_screen/order_status_screen.dart';
class CounterScreen extends StatelessWidget {
  const CounterScreen({
    Key? key,
    required this.width,
    required this.height,
    required this.color,
    required this.orderTypeNumbers,
    required this.orderTypeName,
  }) : super(key: key);

  final double width;
  final double height;
  final Color color;
  final int orderTypeNumbers;
  final String orderTypeName;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.push(context,MaterialPageRoute(builder: (context)=>OrderStatusScreen(orderStatusName: orderTypeName,)));
      },
      borderRadius: BorderRadius.circular(20),
      splashColor: color,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 5,horizontal: 5),
        padding:const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
        height: height,
        width: width,
        decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(20)
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: height*0.3,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text("$orderTypeNumbers",style: TextStyle(
                  color: Colors.white,
                  fontSize: height*0.2
              ),),
            ),
            SizedBox(
              height: height*0.03,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(orderTypeName,style: TextStyle(
                  color: Colors.white,
                  fontSize: height*0.18
              ),),
            ),
            SizedBox(
              height: height*0.2,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text("Tab here to view",style: TextStyle(
                  color: Colors.white,
                  fontSize: height*0.15
              ),),
            ),
          ],
        ),
      ),
    );
  }
}
