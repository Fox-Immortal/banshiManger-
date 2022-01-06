import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:panshimanager/data_layer/models/color_photo.dart';
import 'package:panshimanager/data_layer/models/item_json.dart';
import 'package:panshimanager/presentation_layer/screens/sub_controller_screens/items_screen/add_item_screens/loading_screen.dart';
import 'package:panshimanager/presentation_layer/widgets/popup/popup.dart';

class FourPageAddItemScreen extends StatefulWidget {
  const FourPageAddItemScreen(
      {Key? key,
      required this.itemName,
      required this.itemPrice,
      required this.mainCat,
      required this.subCat,
      required this.sizes,
      required this.description,
      required this.colors})
      : super(key: key);
  final String itemName,description;
  final String itemPrice, mainCat, subCat;
  final List<String> sizes;
  final List<int> colors;

  @override
  _FourPageAddItemScreenState createState() => _FourPageAddItemScreenState();
}

class _FourPageAddItemScreenState extends State<FourPageAddItemScreen> {
  Map<int, List<String>> colorPhotos = {};
  List<List<Widget>> finalList = [];
  List<List<Widget>> rowsList = [];
  List<Widget> finalWidgetList = [];

  List<List<File>>? images = [];
  List<List<String>> imagesPath = [];
  List<List<File>> imagesTemporary = [];
  List<List<String>> imagesUrl = [];
  List<List>selectedPhoto=[];

  final _storage = FirebaseStorage.instance;

  @override
  void initState() {
    clearLists();
    setLists();
    super.initState();
  }

  void clearLists() {
    colorPhotos.clear();
    finalList.clear();
    finalWidgetList.clear();
    rowsList.clear();
  }

  void setLists() {
    finalWidgetList = [];
    print(widget.colors.length);
    for (int element in widget.colors) {
      colorPhotos.putIfAbsent(element, () => []);
      finalList.add([]);
      rowsList.add([]);
      if(images!.length<widget.colors.length){
        images?.add([]);
      }
      if(imagesPath.length<widget.colors.length){
        imagesPath.add([]);
      }
      if(imagesTemporary.length<widget.colors.length){
        imagesTemporary.add([]);
      }
      if(imagesUrl.length<widget.colors.length){
        imagesUrl.add([]);
      }
      if(selectedPhoto.length<widget.colors.length){
        selectedPhoto.add([]);
      }
    }
    for (int i = 0; i < widget.colors.length; i++) {
      for (int j = 0; j < 4; j++) {
        images?[i].add(File(""));
      }
    }
    for (int i = 0; i < widget.colors.length; i++) {
      for (int j = 0; j < 4; j++) {
        imagesPath[i].add("");
      }
    }
    for (int i = 0; i < widget.colors.length; i++) {
      for (int j = 0; j < 4; j++) {
        imagesTemporary[i].add(File(""));
      }
    }
    for (int i = 0; i < widget.colors.length; i++) {
      for (int j = 0; j < 4; j++) {
        imagesUrl[i].add("");
      }
    }
    for (int i = 0; i < widget.colors.length; i++) {
      for (int j = 0; j < 4; j++) {
        selectedPhoto[i].add(false);
      }
    }
  }
  int z=0;
  void checkPhotos() async{
    List<bool>selected = [];
    for (int i = 0; i < widget.colors.length; i++) {
      int count = 0;
      for (int j = 0; j < imagesTemporary[i].length; j++) {
        if (imagesTemporary[i][j].path
            .toString()
            .isNotEmpty) {
          count++;
        }
      }
      if (count > 0) {
        selected.add(true);
      } else {
        selected.add(false);
      }
    }
    int isIn = 0;
    for (int i = 0; i < selected.length; i++) {
      if (!selected[i]) {
        showDialog(context: context,
            builder: (context) =>
            const PopUp(
                errorText: "Please select at least 1 photo for each color"));
        isIn++;
        break;
      }
    }
    if(isIn==0){
      Navigator.push(context,
       MaterialPageRoute(builder: (context)=> LoadingScreen(
           colorPhotos: colorPhotos,
           finalList: finalList,
           rowsList: rowsList,
           finalWidgetList: finalWidgetList,
           images: images,
           imagesPath: imagesPath,
           imagesTemporary: imagesTemporary,
           imagesUrl: imagesUrl,
           selectedPhoto: selectedPhoto,
           itemName: widget.itemName,
           description: widget.description,
           itemPrice: widget.itemPrice,
           mainCat: widget.mainCat,
           subCat: widget.subCat,
           sizes: widget.sizes,
           colors: widget.colors))
      );
    }
    // if (isIn == 0) {
    //   for (int i = 0; i < widget.colors.length; i++) {
    //     for (int j = 0; j < imagesTemporary[i].length; j++) {
    //       if (imagesTemporary[i][j].path.toString().isNotEmpty) {
    //         var snapshot = await _storage
    //               .ref()
    //               .child('folderName/${imagesPath[i][j]}')
    //               .putFile(imagesTemporary[i][j]);
    //           var downloadUrl = await snapshot.ref.getDownloadURL();
    //           setState(() {
    //             imagesUrl[i][j] = downloadUrl;
    //           });
    //       }
    //     }
    //   }
    //   List<List<String>>photos=[];
    //   for(int i=0;i<widget.colors.length;i++){
    //     photos.add([]);
    //   }
    //   for(int i=0;i<widget.colors.length;i++){
    //     for(int j=0;j<imagesUrl[i].length;j++){
    //       if(imagesUrl[i][j].isNotEmpty){
    //         photos[i].add(imagesUrl[i][j]);
    //
    //       }
    //     }
    //   }
    //   List<ColorPhoto>colorsPhoto=[];
    //
    //   // Map<int,List<String>>colorPhotos={};
    //   for(int i=0;i<widget.colors.length;i++){
    //     ColorPhoto bufferColorPhoto=ColorPhoto(color: widget.colors[i], photos: photos[i]);
    //      colorsPhoto.add(bufferColorPhoto);
    //   }
    //
    //   CollectionReference addItem = FirebaseFirestore.instance.collection("Item");
    //   Item one=Item(
    //     name: widget.itemName,
    //     price: widget.itemPrice,
    //     mainCat: widget.mainCat,
    //     subCat: widget.subCat,
    //     sizes: widget.sizes,
    //     description: widget.description,
    //     colorsPhotos:colorsPhoto
    //   );
    //
    //   await addItem.add(one.toJson()).then((value)  {
    //     print(value);
    //   });
    // }
  }

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
      bottomNavigationBar: (Container(
        margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 25),
        width: width * 0.85,
        height: height * 0.065,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            elevation: 10,
            primary: Colors.black,
          ),
          onPressed: checkPhotos,
          child: Text(
            "Confirm",
            style: TextStyle(fontSize: height * 0.03),
          ),
        ),
      )),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
          child: Column(
            children: [
              Column(
                children: getItemPhotos(width, height),
              ),
              SizedBox(
                height: height * 0.02,
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> getItemPhotos(double width, double height) {
    int finalListIndex = 0;
    clearLists();
    setLists();
    colorPhotos.forEach((key, value) {
      finalList[finalListIndex]
          .add(rowColorText(width, height, key, "Photos for color"));
      finalList[finalListIndex].add(SizedBox(
        width: width,
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: getRowList(width, height, finalListIndex)),
        ),
      ));
      finalListIndex++;
    });
    for (List<Widget> i in finalList) {
      for (var element in i) {
        finalWidgetList.add(element);
      }
    }
    return finalWidgetList;
  }

  getRowList(double width, double height, int rowIndex) {
    for (int itemPhotoIndex = 0; itemPhotoIndex < 4; itemPhotoIndex++) {
      rowsList[rowIndex].add(
        itemPhoto(width, height, itemPhotoIndex,rowIndex),
      );
    }
    return rowsList[rowIndex];
  }

  Widget itemPhoto(double width, double height, int itemPhotoIndex,int rowIndex) {
    return Stack(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 5),
          child: DottedBorder(
            borderType: BorderType.RRect,
            radius: const Radius.circular(12),
            child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(12)),
              child: InkWell(
                onTap: () {
                    upLoadImage(rowIndex,itemPhotoIndex);
                    if(imagesTemporary[rowIndex][itemPhotoIndex].path.toString().isNotEmpty){
                      setState(() {
                        selectedPhoto[rowIndex][itemPhotoIndex]=true;
                      });
                    }
                },
                splashColor: Colors.black,
                borderRadius: const BorderRadius.all(Radius.circular(12)),
                child: Container(
                  margin: const EdgeInsets.all(3),
                  height: height * 0.2,
                  width: width * 0.35,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.black12,
                  ),
                  child: Center(
                    child: imagesTemporary[rowIndex][itemPhotoIndex].path.toString() == ""
                        ? FittedBox(
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: height * 0.06,
                                ),
                                Icon(
                                  Icons.add_circle_outline_sharp,
                                  color: Colors.black38,
                                  size: height * 0.07,
                                ),
                                SizedBox(
                                  height: height * 0.02,
                                ),
                                Text(
                                  "Tab to add photo",
                                  style: TextStyle(
                                      color: Colors.black54,
                                      fontSize: height * 0.025),
                                ),
                              ],
                            ),
                        )
                        : Container(
                           decoration: BoxDecoration(
                             borderRadius: BorderRadius.circular(12),
                             image:DecorationImage(
                               image:FileImage(imagesTemporary[rowIndex][itemPhotoIndex],),
                               fit: BoxFit.cover
                             )
                           ),
                        ),
                  ),
                ),
              ),
            ),
          ),
        ),
        Positioned(
          right: width * 0.04,
          top: height * 0.015,
          child: InkWell(
            onTap: () {},
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.black54,
                  borderRadius: BorderRadius.circular(4)),
              height: height * 0.035,
              width: width * 0.1,
              child: FittedBox(
                child: Center(
                  child: IconButton(
                    onPressed: () {
                      setState(() {
                        imagesTemporary[rowIndex][itemPhotoIndex]=File("");
                      });
                    },
                    color: Colors.red,
                    icon: Icon(
                      Icons.remove,
                      color: Colors.red,
                      size: height * 0.04,
                    ),
                  ),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget rowColorText(double width, double height, int color, String text) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Row(
          children: [
            Text(
              text,
              style: TextStyle(
                  fontSize: height * 0.025,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              width: width * 0.01,
            ),
            Container(
              width: width * 0.05,
              height: height * 0.025,
              color: Color(color),
            )
          ],
        ),
      ),
    );
  }

  upLoadImage(int rowIndex,int itemPhotoIndex) async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      setState(() {
        imagesTemporary[rowIndex][itemPhotoIndex] = File(image!.path);
        images?[rowIndex][itemPhotoIndex] = imagesTemporary[rowIndex][itemPhotoIndex];
      });
      setState(() {
        imagesPath[rowIndex][itemPhotoIndex] = image!.path.toString();
      });
    } on PlatformException catch (e) {}
  }
}


