import 'package:flutter/material.dart';
import 'package:panshimanager/constant/my_colors.dart';

class SubItemScreen extends StatelessWidget {
  final Map<String, String> subCatNames;
  final String catName;
  const SubItemScreen(
      {Key? key, required this.subCatNames, required this.catName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: MyColors.myWhite,
      appBar: AppBar(
        backgroundColor: MyColors.myBlack,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(
            Icons.arrow_back,
            color: MyColors.myWhite,
          ),
        ),
        title: Text(catName),
        centerTitle: false,
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  margin:
                  const EdgeInsets.only(top: 5,left: 10,bottom: 10,right: 10),
                  child: Text(
                    "$catName Categories",
                    style: TextStyle(
                        fontSize: height * 0.025,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: getCatDetails(width, height),
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> getCatDetails(double width, double height) {
    List<Widget> catDetails = [];
    subCatNames.forEach((key, value) {
      catDetails.add(
          subCatButton(width, height * 0.08, Colors.black54, key, value));
    });
    return catDetails;
  }

  Widget subCatButton(double width, double height, Color color,
      String subCatName, String subCatPhoto) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      child: ElevatedButton(
          onPressed:() {},
          style: ElevatedButton.styleFrom(
            primary: Colors.white,
            onPrimary: Colors.black,
            padding: EdgeInsets.zero,
            elevation: 0
          ),
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          height: height,
          width: width,
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Card(
                elevation: 4,
                margin: EdgeInsets.zero,
                shape:const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(32))),
                child:  CircleAvatar(
                  backgroundColor: Colors.black,
                    radius: height*0.4,
                    child:  Container(
                      decoration:  BoxDecoration(
                          shape: BoxShape.circle,
                          image:  DecorationImage(image: AssetImage(subCatPhoto),fit: BoxFit.cover)
                      ),
                    )

                ),
              ),
              SizedBox(width: width*0.06,),
              Text(
                subCatName,
                style: TextStyle(
                  fontSize: height*0.3,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
