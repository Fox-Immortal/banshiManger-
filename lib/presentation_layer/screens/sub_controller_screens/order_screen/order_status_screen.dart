import 'package:flutter/material.dart';
import 'package:panshimanager/data_layer/models/order_status.dart';
import 'package:panshimanager/data_layer/web_services/prepered_data/firebase_firestore_services.dart';
import 'package:panshimanager/presentation_layer/widgets/order_widget.dart';


class OrderStatusScreen extends StatefulWidget {
  const OrderStatusScreen({Key? key,required this.orderStatusName}) : super(key: key);
  final String orderStatusName;

  @override
  _OrderStatusScreenState createState() => _OrderStatusScreenState();
}

class _OrderStatusScreenState extends State<OrderStatusScreen> {
  bool isLoading=true;
  @override
  void initState() {
    getOrderData();
    super.initState();
  }
  getOrderData()async{
    await FirebaseFirestoreServices().getOrdersData(context).then((value) => Future.delayed(Duration(seconds: 1)).then((value) {
      setState(() {
        isLoading=false;
      });
    }
    ));
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title:Text("${widget.orderStatusName} Orders"),
        centerTitle: false,
        leading: IconButton(onPressed: (){Navigator.of(context).pop();},icon: const Icon(Icons.arrow_back,color: Colors.white,),),
      ),
      body: Container(
        margin:const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
        child: SingleChildScrollView(
          child:isLoading?Container(
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
          ):Column(
            children: getOrders(width,height),
          ),
        ),
      ),
    );
  }

  List<Widget>getOrders(double width,double height){

    List<OrderStatus>ordersList=[];
    if(widget.orderStatusName=="pending"){
      ordersList=FirebaseFirestoreServices.pendingOrders;
    }else if(widget.orderStatusName=="inReview"){
      ordersList=FirebaseFirestoreServices.inReviewOrders;
    }else if(widget.orderStatusName=="inProgress"){
      ordersList=FirebaseFirestoreServices.inProgressOrders;
    }else{
      ordersList=FirebaseFirestoreServices.finishOrders;
    }
    List<Widget>orders=[];
    for (OrderStatus element in ordersList) {
      if(element.type==widget.orderStatusName){
        orders.add(OrderWidget(width: width, heightX: height,orderStatus:element,orderStatusName: widget.orderStatusName,));
        orders.add(SizedBox(height: height*0.03,));
      }
    }
    return orders;
  }
}