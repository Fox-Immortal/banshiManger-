import 'package:flutter/material.dart';
import 'package:panshimanager/constant/my_colors.dart';
import 'package:panshimanager/presentation_layer/screens/sub_controller_screens/items_screen/add_item_screens/second_page_add_item_screen.dart';


class FirstPageAddItemScreen extends StatefulWidget {
  final String prevCat;
  final List<String>categories;
  const FirstPageAddItemScreen({Key? key,required this.prevCat,required this.categories}) : super(key: key);

  @override
  _FirstPageAddItemScreenState createState() => _FirstPageAddItemScreenState();
}

class _FirstPageAddItemScreenState extends State<FirstPageAddItemScreen> {

  @override
  Widget build(BuildContext context) {
    double width=MediaQuery.of(context).size.width;
    double height=MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title:const Text("Add Items"),
        centerTitle: false,
        leading: IconButton(
          onPressed: (){
            Navigator.of(context).pop();
          },
          icon:const Icon(Icons.arrow_back,color: Colors.white,),
        ),
      ),
      floatingActionButton:CircleAvatar(
        backgroundColor: val>-1?MyColors.myOrange:Colors.grey,
        radius: height*0.04,
        child: Center(
          child: IconButton(
             onPressed:val>-1? (){
               widget.prevCat.isEmpty?
               Navigator.push(context,MaterialPageRoute(builder: (context)=>FirstPageAddItemScreen(prevCat: widget.categories[val],categories:
                 val==0?womenSubCat:val==1?menSubCat:val==2?girlsSubCat:val==3?boysSubCat:val==4?beautySubCat:shoesSubCat,)))
                   :Navigator.push(context,MaterialPageRoute(builder: (context)=>SecondPageAddItemScreen(mainCat: widget.prevCat, subCat: widget.categories[val])));
             }:(){},
            icon:const Icon(Icons.arrow_forward_outlined,color: Colors.white,),
          )
        ),
      ),
      body: Container(
        margin:const EdgeInsets.symmetric(vertical: 10,horizontal: 10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  margin:
                  const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: Text(
                    "Please chose a category",
                    style: TextStyle(
                        fontSize: height * 0.025,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: getCategories(width, height, context)
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> getCategories(double width, double height,context) {
    List<Widget> categories = [];
    int index=0;
    for (String element in widget.categories) {
      setState(() {
        categories.add(
          categorySelector(width, height*0.15, element, index)
        );
        index++;
      });
    }return categories;
  }
  int val=-1;
  Widget categorySelector(double width,double height,String name,int index){
    return InkWell(
      onTap: (){
        setState(() {
          val=index;
        });
      },
      child: Container(
        padding:const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Radio(value: index, groupValue: val, onChanged:(value){
              setState(() {
                  val=value as int;
              });
            },activeColor: MyColors.myOrange,),
            SizedBox(
              width: width*0.01,
            ),
            Text(name,
              style: TextStyle(
                fontSize: height*0.3,
                fontWeight: FontWeight.w300
              ),
            )
          ],
        ),
      ),
    );
  }

  List<String>menSubCat=[
    "Jackets",
    "Sweatshirts",
    "Tees",
    "Jeans",
    "Pants",
    "Co-ords",
    "Swimwear",
    "Underwear",
    "Shirts",
    "Poloshirts",
    "Socks",
  ];
  List<String>womenSubCat=[
    "T-shirts",
    "Sweatshirts",
    "Blouses",
    "Jackets",
    "Hoodies",
    "Pullovers",
    "Dresses",
    "Pants",
    "Jeans",
    "Shorts",
    "Socks",
    "Home",
  ];
  List<String>boysSubCat=[
    "T-shirts",
    "Jackets",
    "Knitwear",
    "Shirts",
    "Poloshirts",
    "Pants",
    "Jeans",
    "Home",
    "Swimwear",
  ];

  List<String>girlsSubCat=[
    "T-shirts",
    "Jackets",
    "Sweatshirts",
    "Blouse",
    "Pants",
    "Jeans",
    "Home",
    "Skirts",
    "Dresses",
  ];


  List<String>beautySubCat=[
    "Face",
    "Eyes",
    "Lips",
    "Nails",
    "Skin",
    "Hair",
    "Accessories",
    "Fragrances",
    "MackUp kit",
    "Beauty Tools",
  ];


  List<String>shoesSubCat=[
    "Casual",
    "Sport",
    "Boots",
    "Heels",
    "Sandals",
    "Slipper",
    "Men Formal",
    "Men Sport",
    "Men Boots",
  ];

}




