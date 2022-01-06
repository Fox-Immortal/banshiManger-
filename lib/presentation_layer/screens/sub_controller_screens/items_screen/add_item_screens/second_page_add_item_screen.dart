import 'package:flutter/material.dart';
import 'package:panshimanager/constant/my_colors.dart';
import 'package:panshimanager/presentation_layer/screens/sub_controller_screens/items_screen/add_item_screens/first_page_add_item_screen.dart';
import 'package:panshimanager/presentation_layer/screens/sub_controller_screens/items_screen/add_item_screens/third_page_add_item_screen.dart';
import 'package:panshimanager/presentation_layer/widgets/field_box.dart';
import 'package:panshimanager/presentation_layer/widgets/row_text.dart';

class SecondPageAddItemScreen extends StatefulWidget {
  const SecondPageAddItemScreen(
      {Key? key, required this.mainCat, required this.subCat})
      : super(key: key);
  final String mainCat, subCat;
  @override
  _SecondPageAddItemScreenState createState() =>
      _SecondPageAddItemScreenState();
}

class _SecondPageAddItemScreenState extends State<SecondPageAddItemScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController firstController = TextEditingController();
  TextEditingController secondController = TextEditingController();
  TextEditingController thirdController = TextEditingController();
  TextEditingController fourController = TextEditingController();
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  int sizes = 0;
  isOk() {
    bool yes = false;
    if (nameController.text.isNotEmpty && priceController.text.isNotEmpty) {
      if (firstController.text.isNotEmpty ||
          secondController.text.isNotEmpty ||
          thirdController.text.isNotEmpty ||
          fourController.text.isNotEmpty) {
        setState(() {
          yes = true;
          sizes++;
        });
      }
    }
    return yes;
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
      floatingActionButton: CircleAvatar(
        backgroundColor: MyColors.myOrange,
        radius: height * 0.04,
        child: Center(
            child: IconButton(
          onPressed: () {
            formkey.currentState!.validate();
            isOk();
            if (formkey.currentState!.validate()) {
              if (isOk()) {
                List<String> sizes = [];
                setState(() {
                  if (firstController.text.isNotEmpty) {
                    sizes.add(firstController.text);
                  }
                  if (secondController.text.isNotEmpty) {
                    sizes.add(secondController.text);
                  }
                  if (thirdController.text.isNotEmpty) {
                    sizes.add(thirdController.text);
                  }
                  if (fourController.text.isNotEmpty) {
                    sizes.add(fourController.text);
                  }
                });
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ThirdPageAddItemScreen(
                            name: nameController.text,
                            mainCat: widget.mainCat,
                            subCat: widget.subCat,
                            description: descriptionController.text,
                            price: priceController.text,
                            sizes: sizes)));
              }
            }
          },
          icon: const Icon(
            Icons.arrow_forward_outlined,
            color: Colors.white,
          ),
        )),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            RowText(height: height, text: "Your item category"),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  roundedText(
                      width, height * 0.05, widget.mainCat, height * 0.025),
                  roundedText(
                      width, height * 0.05, widget.subCat, height * 0.025)
                ],
              ),
            ),
            Form(
              key: formkey,
              child: Column(
                children: [
                  RowText(height: height, text: "Please enter item name"),
                  FieldBox(
                    width: width * 0.95,
                    height: height * 0.12,
                    sizes: sizes,
                    boxName: "Name",
                    boxHint: "Enter item name",
                    textInputType: TextInputType.text,
                    boxController: nameController,
                    readOnly: false,
                    onTab: () {},
                    maxLines: 1,
                    fieldType: 'name',
                  ),
                  RowText(height: height, text: "Please enter item description"),
                  FieldBox(
                    width: width * 0.95,
                    height: height * 0.12,
                    sizes: sizes,
                    boxName: "Description",
                    boxHint: "Enter item description",
                    textInputType: TextInputType.text,
                    boxController: descriptionController,
                    readOnly: false,
                    onTab: () {},
                    maxLines: 1,
                    fieldType: 'description',
                  ),
                  RowText(height: height, text: "Please enter item price"),
                  FieldBox(
                    width: width * 0.95,
                    height: height * 0.12,
                    sizes: sizes,
                    boxName: "Price",
                    boxHint: "Enter item price",
                    textInputType: TextInputType.number,
                    boxController: priceController,
                    readOnly: false,
                    onTab: () {},
                    maxLines: 1,
                    fieldType: 'price',
                  ),
                  RowText(height: height, text: "Please enter item sizes"),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        FieldBox(
                          width: width * 0.45,
                          height: height * 0.12,
                          sizes: sizes,
                          boxName: "Name",
                          boxHint: "Size one",
                          textInputType: TextInputType.text,
                          boxController: firstController,
                          readOnly: false,
                          onTab: () {},
                          maxLines: 1,
                          fieldType: 'size',
                        ),
                        FieldBox(
                          width: width * 0.45,
                          height: height * 0.12,
                          sizes: sizes,
                          boxName: "Name",
                          boxHint: "Size two",
                          textInputType: TextInputType.text,
                          boxController: secondController,
                          readOnly: false,
                          onTab: () {},
                          maxLines: 1,
                          fieldType: 'size',
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        FieldBox(
                          width: width * 0.45,
                          height: height * 0.12,
                          sizes: sizes,
                          boxName: "Name",
                          boxHint: "Size three",
                          textInputType: TextInputType.text,
                          boxController: thirdController,
                          readOnly: false,
                          onTab: () {},
                          maxLines: 1,
                          fieldType: 'size',
                        ),
                        FieldBox(
                          width: width * 0.45,
                          height: height * 0.12,
                          sizes: sizes,
                          boxName: "Name",
                          boxHint: "Size four",
                          textInputType: TextInputType.text,
                          boxController: fourController,
                          readOnly: false,
                          onTab: () {},
                          maxLines: 1,
                          fieldType: 'size',
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget roundedText(
      double width, double height, String cat, double fontSize) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.black, width: height * 0.01),
      ),
      height: height,
      margin: const EdgeInsets.symmetric(horizontal: 5),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      child: Center(
        child: Text(
          cat,
          style: TextStyle(color: Colors.black, fontSize: fontSize),
        ),
      ),
    );
  }
}

