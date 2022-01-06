import 'package:flutter/material.dart';
import 'package:panshimanager/presentation_layer/screens/sub_controller_screens/items_screen/sub_item_screen.dart';
class CategoriesButton extends StatelessWidget {
  const CategoriesButton({
    Key? key,
    required this.context,
    required this.width,
    required this.height,
    required this.categoryColor,
    required this.categoryName,
    required this.photo,
    required this.subCatNames,
  }) : super(key: key);

  final BuildContext context;
  final double width;
  final double height;
  final Color categoryColor;
  final String categoryName;
  final String photo;
  final Map<String, String> subCatNames;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.push(context,MaterialPageRoute(builder:(context)=>SubItemScreen(catName: categoryName,subCatNames: subCatNames,)));
      },
      borderRadius: BorderRadius.circular(20),
      splashColor: categoryColor,
      child: Container(
        margin:const EdgeInsets.symmetric(horizontal: 5,vertical: 5),
        width: width,
        height: height,
        decoration: BoxDecoration(
            gradient:const LinearGradient(
                colors: [
                  Colors.black54,
                  Colors.black54,
                  Colors.black54,
                  Colors.black54,
                  Colors.transparent
                ],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight
            ),
            borderRadius: BorderRadius.circular(20),
            image: DecorationImage(
                image: AssetImage(photo),
                fit: BoxFit.fitWidth
            )
        ),
        child: Container(
          width: width,
          height: height,
          padding:const EdgeInsets.symmetric(horizontal: 5),
          decoration:BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            gradient:const LinearGradient(
                colors: [
                  Colors.black54,
                  Colors.transparent
                ],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight
            ),
          ),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(categoryName,
              style: TextStyle(
                  fontSize: height*0.45,
                  fontWeight: FontWeight.w200,
                  color: Colors.white
              ),

            ),
          ),
        ),
      ),
    );
  }
}