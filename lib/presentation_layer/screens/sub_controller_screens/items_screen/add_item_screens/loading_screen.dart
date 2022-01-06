import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:panshimanager/constant/my_colors.dart';
import 'package:panshimanager/data_layer/models/color_photo.dart';
import 'package:panshimanager/data_layer/models/item_json.dart';
import 'package:panshimanager/presentation_layer/screens/controller_screen/controller_screen.dart';
import 'package:panshimanager/presentation_layer/screens/sub_controller_screens/items_screen/items_screen.dart';



class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key? key,required this.colorPhotos,required this.finalList,
    required this.rowsList,required this.finalWidgetList,required this.images,
    required this.imagesPath,required this.imagesTemporary,required this.imagesUrl,required this.selectedPhoto,
    required this.itemName,
    required this.description,
    required this.itemPrice,
    required this.mainCat,required this.subCat,
    required this.sizes,required this.colors}) : super(key: key);
  final Map<int, List<String>> colorPhotos;
  final List<List<Widget>> finalList;
  final List<List<Widget>> rowsList;
  final List<Widget> finalWidgetList;

  final List<List<File>>? images;
  final List<List<String>> imagesPath;
  final List<List<File>> imagesTemporary;
  final List<List<String>> imagesUrl;
  final List<List>selectedPhoto;

  final String itemName,description;
  final String itemPrice, mainCat, subCat;
  final List<String> sizes;
  final List<int> colors;


  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

  final _storage = FirebaseStorage.instance;
  CollectionReference addItem = FirebaseFirestore.instance.collection("Item");

  @override
  void initState() {
    uploadPhoto();
    super.initState();
  }

  uploadPhoto()async{
    for (int i = 0; i < widget.colors.length; i++) {
      for (int j = 0; j < widget.imagesTemporary[i].length; j++) {
        if (widget.imagesTemporary[i][j].path.toString().isNotEmpty) {
          var snapshot = await _storage
              .ref()
              .child('folderName/${widget.imagesPath[i][j]}')
              .putFile(widget.imagesTemporary[i][j]);
          var downloadUrl = await snapshot.ref.getDownloadURL();
          setState(() {
            widget.imagesUrl[i][j] = downloadUrl;
          });
        }
      }
    }
    List<List<String>>photos=[];
    for(int i=0;i<widget.colors.length;i++){
      photos.add([]);
    }
    for(int i=0;i<widget.colors.length;i++){
      for(int j=0;j<widget.imagesUrl[i].length;j++){
        if(widget.imagesUrl[i][j].isNotEmpty){
          photos[i].add(widget.imagesUrl[i][j]);

        }
      }
    }
    List<ColorPhoto>colorsPhoto=[];
    for(int i=0;i<widget.colors.length;i++){
      ColorPhoto bufferColorPhoto=ColorPhoto(color: widget.colors[i], photos: photos[i]);
      colorsPhoto.add(bufferColorPhoto);
    }
    Item one=Item(
        name: widget.itemName,
        price: widget.itemPrice,
        mainCat: widget.mainCat,
        subCat: widget.subCat,
        sizes: widget.sizes,
        description: widget.description,
        colorsPhotos:colorsPhoto,
    );

    await addItem.add(one.toJson()).then((value)  {
      Navigator.push(context,(MaterialPageRoute(builder: (context)=>const ControllerScreen())));
    });
  }


  @override
  Widget build(BuildContext context) {
    double width=MediaQuery.of(context).size.width;
    double height=MediaQuery.of(context).size.height;
    return Scaffold(
      body:SizedBox(
        width: width,
        height: height,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator(
                color: MyColors.myBlack,
                strokeWidth: width*0.01,
              ),
              SizedBox(
                height: height*0.02,
              ),
              const Text("Uploading Item"),
            ],
          ),
        ),
      ) ,
    );
  }
}
