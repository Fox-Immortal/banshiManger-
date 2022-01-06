import 'package:flex_color_picker/flex_color_picker.dart';
import 'package:flutter/material.dart';
import 'package:panshimanager/constant/my_colors.dart';
import 'package:panshimanager/presentation_layer/screens/sub_controller_screens/items_screen/add_item_screens/four_page_add_item_screen.dart';
import 'package:panshimanager/presentation_layer/widgets/popup/popup.dart';
import 'package:panshimanager/presentation_layer/widgets/row_text.dart';

class ThirdPageAddItemScreen extends StatefulWidget {
  const ThirdPageAddItemScreen(
      {Key? key,
      required this.name,
      required this.mainCat,
      required this.subCat,
      required this.price,
      required this.sizes,required this.description})
      : super(key: key);
  final String name, mainCat, subCat;
  final String price,description;
  final List<String> sizes;

  @override
  _ThirdPageAddItemScreenState createState() => _ThirdPageAddItemScreenState();
}

class _ThirdPageAddItemScreenState extends State<ThirdPageAddItemScreen> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text("Add Items"),
        centerTitle: false,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
      ),
      floatingActionButton: CircleAvatar(
        backgroundColor: MyColors.myOrange,
        radius: height * 0.04,
        child: Center(
            child: IconButton(
              onPressed: (){
                List<int>selectedIndexColor=[];
                for(int i=0;i<6;i++){
                  if(colorChanges[i]){
                    selectedIndexColor.add(i);
                  }
                }
                if(selectedIndexColor.isNotEmpty){
                  List<int>colorValues=[];
                  for(int i=0;i<selectedIndexColor.length;i++){
                    colorValues.add(colorsIte[selectedIndexColor[i]].value);
                  }
                  Navigator.push(context,MaterialPageRoute(builder: (context)=>FourPageAddItemScreen(
                      itemName: widget.name,
                      itemPrice: widget.price,
                      mainCat: widget.mainCat,
                      subCat: widget.subCat,
                      sizes: widget.sizes,
                      description: widget.description,
                      colors: colorValues
                    )
                   )
                  );
                }else{
                  showDialog(context: context, builder: (context){
                    return const PopUp(errorText: "Please select color first");
                  });
                }
              },
              icon: const Icon(
                Icons.arrow_forward_outlined,
                color: Colors.white,
              ),
            )),
      ),

      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RowText(height: height, text: "Please enter item colors"),
              Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: getItemColors(width, height),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> getItemColors(double width, double height) {
    List<Widget> itemColors = [];
    itemColors.add(
      itemColor(width, height, "Color 1",0),
    );
    itemColors.add(
      itemColor(width, height, "Color 2",1),
    );
    itemColors.add(
      itemColor(width, height, "Color 3",2),
    );
    itemColors.add(
      itemColor(width, height, "Color 4",3),
    );
    itemColors.add(
      itemColor(width, height, "Color 5",4),
    );
    itemColors.add(
      itemColor(width, height, "Color 6",5),
    );
    return itemColors;
  }

  List<Color>colorsIte=[
    Color(0xffffffff),
    Color(0xffffffff),
    Color(0xffffffff),
    Color(0xffffffff),
    Color(0xffffffff),
    Color(0xffffffff),
  ];
  List<bool>colorChanges=[
    false,
    false,
    false,
    false,
    false,
    false,
  ];

  Widget itemColor(double width, double height, String textColor,int index) {
    return Container(
      height:  height * 0.08,
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: ElevatedButton(
        onPressed: () {
          showDialog(context: context, builder:(context){
            return Dialog(
              child: Container(
                width: width,
                height: height*0.7,
                color: Colors.transparent,
                  child:SizedBox(
                    height: height*0.8,
                    width: width*0.6,
                    child: ColorPicker(
                      onColorChanged:(color){
                        setState(() {
                          colorsIte[index]=color;
                          colorChanges[index]=true;
                        });
                      },
                      wheelDiameter: 250,
                      wheelWidth: 24,
                      wheelHasBorder: true,
                      showColorCode: true,
                      enableShadesSelection: true,
                      pickersEnabled: const <ColorPickerType,bool>{
                        ColorPickerType.both:false,
                        ColorPickerType.primary:true,
                        ColorPickerType.custom:false,
                        ColorPickerType.accent:true,
                        ColorPickerType.bw:false,
                        ColorPickerType.wheel:true
                      },
                      actionButtons:const ColorPickerActionButtons(
                        okButton: true,
                        dialogActionButtons: false,
                      ),

                    ),
                ),
              ),
            );
          });
        },
        style: ElevatedButton.styleFrom(
            elevation: 10, primary: MyColors.myBlack, padding: EdgeInsets.zero),
        child: Container(
          height: height*0.08,
          width: width,
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(textColor),
              CircleAvatar(
                backgroundColor:colorsIte[index],
                radius: height * 0.08*0.3,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
