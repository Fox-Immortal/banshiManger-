import 'package:flutter/material.dart';
import 'package:panshimanager/presentation_layer/screens/sub_controller_screens/items_screen/add_item_screens/first_page_add_item_screen.dart';
import 'package:panshimanager/presentation_layer/widgets/categories_button.dart';
import 'package:panshimanager/presentation_layer/widgets/counter_screen.dart';

class ItemsScreen extends StatefulWidget {
  const ItemsScreen({Key? key}) : super(key: key);

  @override
  _ItemsScreenState createState() => _ItemsScreenState();
}

class _ItemsScreenState extends State<ItemsScreen> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: Text(
                    "Stock Analytics",
                    style: TextStyle(
                        fontSize: height * 0.025,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              GridView(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: (height + height * 0.1) / height,
                ),
                shrinkWrap: true,
                physics: const ClampingScrollPhysics(),
                children: getItemsAnalytics(width, height),
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                height: height * 0.075,
                width: width,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,MaterialPageRoute(builder: (context)=>const FirstPageAddItemScreen(
                      prevCat: "",
                      categories: ["Women","Men","Girls","Boys","Beauty","Shoes"],
                    )));
                  },
                  style: ElevatedButton.styleFrom(
                      elevation: 10, primary:const Color(0xffdf861d),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))
                  ),
                  child: Center(
                    child: Text(
                      "Add Item",
                      style: TextStyle(
                        fontSize: height*0.025
                      ),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  margin:
                  const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: Text(
                    "Items Categories",
                    style: TextStyle(
                        fontSize: height * 0.025,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: getCategories(width,height)
              )
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> getCategories(double width, double height) {
    List<Widget> categories = [];
    categories.add(
      CategoriesButton(context: context, width: width, height: height*0.2, categoryColor: Colors.black54, categoryName: "Women", photo: "assets/images/1.jpg", subCatNames: womenOptionsDetails)
    );
    categories.add(
        CategoriesButton(context: context, width: width, height: height*0.2, categoryColor: Colors.black54, categoryName: "Men", photo: "assets/images/2.jpg", subCatNames: menOptionsDetails)
    );
    categories.add(
        CategoriesButton(context: context, width: width, height: height*0.2, categoryColor: Colors.black54, categoryName: "Girls", photo: "assets/images/3.jpg", subCatNames: girlsOptionsDetails)
    );
    categories.add(
        CategoriesButton(context: context, width: width, height: height*0.2, categoryColor: Colors.black54, categoryName: "Boys", photo: "assets/images/4.jpg", subCatNames: boysOptionsDetails)
    );
    categories.add(
        CategoriesButton(context: context, width: width, height: height*0.2, categoryColor: Colors.black54, categoryName: "Beauty", photo: "assets/images/5.jpg", subCatNames: beautyOptionsDetails)
    );
    categories.add(
        CategoriesButton(context: context, width: width, height: height*0.2, categoryColor: Colors.black54, categoryName: "Shoes", photo: "assets/images/6.jpg", subCatNames: shoesOptionsDetails)
    );
    return categories;
  }

  List<Widget> getItemsAnalytics(double width, double height) {
    List<Widget> itemsAnalytics = [];
    itemsAnalytics.add(
      CounterScreen(
          width: width * 0.4,
          height: height * 0.15,
          color: const Color(0xfffdc029),
          orderTypeNumbers: 10,
          orderTypeName: "InStock"),
    );
    itemsAnalytics.add(
      CounterScreen(
          width: width * 0.4,
          height: height * 0.15,
          color: const Color(0xff171820),
          orderTypeNumbers: 15,
          orderTypeName: "Ordering"),
    );
    return itemsAnalytics;
  }

  Map<String, String> menOptionsDetails = {
    "Jackets": "assets/images/menjacket2.jpeg",
    "Sweatshirts": "assets/images/mensweatshirt.jpeg",
    "Tees": "assets/images/mentees3.jpeg",
    "Jeans": "assets/images/menjeans2.jpeg",
    "Pants": "assets/images/menpants2.jpg",
    "Co-ords": "assets/images/menco.jpeg",
    "Swimwear": "assets/images/menswim1.jpeg",
    "Underwear": "assets/images/menunder.jpeg",
    "Shirts": "assets/images/menshirts3.jpeg",
    "Poloshirts": "assets/images/menpolo.jpeg",
    "Socks": "assets/images/mensocks.jpeg",
  };
  Map<String, String> womenOptionsDetails = {
    "T-shirts": "assets/images/womentshirt.jpeg",
    "Sweatshirts": "assets/images/womensweat.jpeg",
    "Blouses": "assets/images/womenblouse.jpeg",
    "Jackets": "assets/images/womenjackets.jpeg",
    "Hoodies": "assets/images/womenhoodies.jpeg",
    "Pullovers": "assets/images/womnpull.jpeg",
    "Dresses": "assets/images/womendress2.jpeg",
    "Pants": "assets/images/womenpants.jpeg",
    "Jeans": "assets/images/womenjeans.jpeg",
    "Shorts": "assets/images/womenshorts.jpeg",
    "Socks": "assets/images/womensocks.jpeg",
    "Home": "assets/images/womenhome2.jpeg",
  };
  Map<String, String> boysOptionsDetails = {
    "T-shirts": "assets/images/boytshirt.jpeg",
    "Jackets": "assets/images/boyjacket.jpeg",
    "Knitwear": "assets/images/boykn.jpeg",
    "Shirts": "assets/images/boyshirt.jpeg",
    "Poloshirts": "assets/images/boypolo.jpeg",
    "Pants": "assets/images/boypant.jpeg",
    "Jeans": "assets/images/boyjeans.jpeg",
    "Home": "assets/images/boyhome.jpeg",
    "Swimwear": "assets/images/boyswim.jpeg",
  };
  Map<String, String> girlsOptionsDetails = {
    "T-shirts": "assets/images/girlblouse.jpeg",
    "Jackets": "assets/images/girljacket.jpeg",
    "Sweatshirts": "assets/images/girlsweat1.jpeg",
    "Blouse": "assets/images/girltshirt.jpeg",
    "Pants": "assets/images/girlpant.jpeg",
    "Jeans": "assets/images/girljeans.jpeg",
    "Home": "assets/images/girlhome.jpeg",
    "Skirts": "assets/images/girlskirt.jpeg",
    "Dresses": "assets/images/girldress1.jpeg",
  };
  Map<String, String> beautyOptionsDetails = {
    "Face": "assets/images/beautyface.jpeg",
    "Eyes": "assets/images/beautyeye.jpeg",
    "Lips": "assets/images/beautylips.png",
    "Nails": "assets/images/beautynails.jpeg",
    "Skin": "assets/images/beautyskin.jpeg",
    "Hair": "assets/images/beautyhair.jpeg",
    "Accessories": "assets/images/beautyacc.jpeg",
    "Fragrances": "assets/images/beautyfrag.jpeg",
    "MackUp kit": "assets/images/beautykit.jpeg",
    "Beauty Tools": "assets/images/beautytools.jpeg",
  };
  Map<String, String> shoesOptionsDetails = {
    "Casual": "assets/images/scasual.jpeg",
    "Sport": "assets/images/ssport.jpeg",
    "Boots": "assets/images/sboots.jpeg",
    "Heels": "assets/images/sheels.jpeg",
    "Sandals": "assets/images/ssandals.png",
    "Slipper": "assets/images/sslipper.jpeg",
    "Men Formal": "assets/images/sformal.jpeg",
    "Men Sport": "assets/images/smensport.jpeg",
    "Men Boots": "assets/images/smenboot.jpeg",
  };


}
