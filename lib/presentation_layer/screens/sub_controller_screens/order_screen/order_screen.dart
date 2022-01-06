import 'package:flutter/material.dart';
import 'package:panshimanager/constant/my_colors.dart';
import 'package:panshimanager/data_layer/models/cart_item_details.dart';
import 'package:panshimanager/data_layer/models/item_details.dart';
import 'package:panshimanager/data_layer/models/order.dart';
import 'package:panshimanager/data_layer/web_services/prepered_data/firebase_firestore_services.dart';
import 'package:panshimanager/data_layer/web_services/prepered_data/prepered.dart';
import 'package:panshimanager/presentation_layer/widgets/counter_screen.dart';


class OrderScreen extends StatefulWidget {
  const OrderScreen({Key? key}) : super(key: key);

  @override
  _OrderScreenState createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  bool isLoading=true;
  @override
  void initState() {
    getData();
    super.initState();
  }
  getData()async{
    await FirebaseFirestoreServices().getOrdersData(context).then((value) => Future.delayed(const Duration(seconds: 1))).then((value) {
        setState(() {
          isLoading=false;
        });
    });
  }
  @override
  Widget build(BuildContext context) {
    double width=MediaQuery.of(context).size.width;
    double height=MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: MyColors.myWhite,
      body:isLoading?Container(
        alignment: Alignment.center,
        child: Column(
          children: [
            CircularProgressIndicator(
              color: Colors.black,
              strokeWidth: width*0.01,
            ),
            const Text("Loading Data"),
          ],
        ),
      ): Container(
        margin:const EdgeInsets.symmetric(vertical: 10,horizontal: 10),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin:const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                child: Text(
                  "Orders Status",
                  style: TextStyle(
                    fontSize: height*0.025,
                    color: Colors.black,
                    fontWeight: FontWeight.bold
                  ),
                ),
              ),
              GridView(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: (height+height*0.1) / height,
                ),
                shrinkWrap: true,
                physics: const ClampingScrollPhysics(),
                children: getOrdersType(width, height),
              ),
              Container(
                margin:const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                child: Text(
                  "Last Orders",
                  style: TextStyle(
                      fontSize: height*0.025,
                      color: Colors.black,
                      fontWeight: FontWeight.bold
                  ),
                ),
              ),
              Container(
                margin:const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: getLastOrders(width, height),
                ),
              )
             ],
          ),
        ),
      ),
    );
  }

  List<Widget>getLastOrders(double width,double height){
    List<Widget>orders=[];
    List<CartItemDetails>items=[];
    PrevData.womenDetailsCategories.forEach((key, value) {
      for (ItemDetails element in value) {
        setState(() {
          items.add(
            CartItemDetails(itemDetails: element, selectedColor: Colors.black.value, selectedSize: "s")
          );
        });
      }
    });
    Order orderOne=Order(orderPerson: "HousamJehad", total: 30, items:{1:items[0],2:items[1],3:items[2]});
    orders.add(
       order(width, height*0.25,orderOne)
     );
    return orders;
  }
  List<Widget>getOrdersType(double width,double height){
    List<Widget>ordersTypes=[];
    FirebaseFirestoreServices().getOrders();
    ordersTypes.add(
      CounterScreen(width: width*0.4, height: height*0.15, color: const Color(0xfffdc029), orderTypeNumbers: FirebaseFirestoreServices.inProgressOrders.length, orderTypeName: "inProgress"),
    );
     ordersTypes.add(
       CounterScreen(width: width*0.4, height: height*0.15, color: const Color(0xff171820), orderTypeNumbers: FirebaseFirestoreServices.pendingOrders.length, orderTypeName: "pending"),
    );
    ordersTypes.add(
      CounterScreen(width: width*0.4, height: height*0.15, color: const Color(0xffdf861d), orderTypeNumbers: FirebaseFirestoreServices.inReviewOrders.length, orderTypeName: "inReview"),
    );
    ordersTypes.add(
      CounterScreen(width: width*0.4, height: height*0.15, color: const Color(0xffaa3d01), orderTypeNumbers: FirebaseFirestoreServices.finishOrders.length, orderTypeName: "finish"),
    );
    return ordersTypes;
  }

  Widget order(double width,double height,Order order){
   return ElevatedButton(
     onPressed: (){},
     style: ElevatedButton.styleFrom(
       primary: Colors.white,
       shape: RoundedRectangleBorder(
         borderRadius: BorderRadius.circular(10),
       ),
       elevation: 10,
       padding: EdgeInsets.zero
     ),
     child: SizedBox(
       // margin:const EdgeInsets.symmetric(vertical: 10,horizontal: 10),
       width: width,
       child: Column(
         mainAxisAlignment: MainAxisAlignment.start,
         children: [
           Container(
             decoration:const BoxDecoration(
               color: Color(0xffdf861d),
               borderRadius: BorderRadius.only(
                   topRight: Radius.circular(10),
                   topLeft: Radius.circular(10)
               ),
             ),
             padding:const EdgeInsets.symmetric(horizontal: 10),
             height: height*0.22,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                   "Person :",
                   style: TextStyle(
                     fontSize: height*0.1,
                     color: Colors.white,
                     fontWeight: FontWeight.w400
                   ),
                ),
                SizedBox(width: width*0.03,),
                Text(
                  order.orderPerson,
                  style: TextStyle(
                      fontSize: height*0.1,
                      color: Colors.white,
                      fontWeight: FontWeight.w400
                  ),
                ),
              ],
            ),
           ),
           Container(
             decoration: BoxDecoration(
               border: Border(
                 top: BorderSide(color: Colors.grey,width: height*0.003),
                 bottom: BorderSide(color: Colors.grey,width: height*0.003),
               )
             ),
             padding:const EdgeInsets.symmetric(horizontal: 10),
             height: height*0.22,
             child: Row(
               mainAxisAlignment: MainAxisAlignment.start,
               children: [
                 Text(
                   "Total :",
                   style: TextStyle(
                       fontSize: height*0.1,
                       color: Colors.black,
                       fontWeight: FontWeight.w400
                   ),
                 ),
                 SizedBox(width: width*0.03,),
                 Text(
                   "\$${order.total} JD",
                   style: TextStyle(
                       fontSize: height*0.1,
                       color: Colors.black,
                       fontWeight: FontWeight.w400
                   ),
                 ),
               ],
             ),

           ),
           Container(
             padding:const EdgeInsets.symmetric(horizontal: 10),
             child: Column(
               mainAxisAlignment: MainAxisAlignment.start,
               crossAxisAlignment: CrossAxisAlignment.start,
               children:getOrderItems(width,height,order),
             ),
           ),
           SizedBox(height: height*0.05,)
         ],

       ),
     ),
   );
 }
 List<Widget> getOrderItems(double width,double height,Order order){
    List<Widget>orderItems=[];
    int i=0;
    order.items.forEach((key, value) {
     if(i<2){
       orderItems.add(
           orderItem(width,height,value)
       );
     }
     i++;
    });
    return orderItems;
 }

 Widget orderItem(double width,double height,CartItemDetails cartItemDetails){
    String photo="";
    cartItemDetails.itemDetails.itemColorsPhotos.forEach((key, value) {
      for (String element in value) {
        setState(() {
          photo=element;
        });
      }});

    return SizedBox(
      width: width,
      height: height*0.22,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            "1 x",
            style: TextStyle(
                fontSize: height*0.1,
                color: Colors.black,
                fontWeight: FontWeight.w400
            ),
          ),
          SizedBox(width: width*0.03,),
          CircleAvatar(
            backgroundColor: Colors.yellow,
            radius: 15,
            backgroundImage:AssetImage(photo)
          ),
          SizedBox(width: width*0.03,),
          Text(
            cartItemDetails.itemDetails.itemName,
            style: TextStyle(
                fontSize: height*0.1,
                color: Colors.black,
                fontWeight: FontWeight.w400
            ),
          ),
        ],
      ),
    );
 }


}

