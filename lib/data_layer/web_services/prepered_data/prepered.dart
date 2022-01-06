import'package:flutter/material.dart';
import 'package:panshimanager/data_layer/models/item_details.dart';

class PrevData{
  static Map<String, List<ItemDetails>> womenDetailsCategories = {
    "T-shirt & Blouses": [
      ItemDetails(
          itemName: "T-shirt",
          itemPrice: 19.99,
          itemIsLove: false,
          itemDescription:
          "Here you can choose things for any wardrobe, even change your style",
          itemColorsPhotos: {
            Colors.red.value: ["assets/images/momen1.webp","assets/images/women2.webp","assets/images/momen3.webp","assets/images/women4.webp"],
            Colors.black.value: ["assets/images/women5.webp","assets/images/women6.webp","assets/images/women7.webp","assets/images/women8.webp"],
            Colors.green.value: ["assets/images/women11.webp","assets/images/women12.webp","assets/images/women13.webp","assets/images/women14.webp"],
          },
        itemSizes: ["S","M","L","XL","2XL"],
        categories: ["Women","T-shirt"]
      ),
      ItemDetails(
          itemName: "Blouse",
          itemPrice: 30.5,
          itemIsLove: false,
          itemDescription:
          "Here you can choose things for any wardrobe, even change your style",
          itemColorsPhotos: {
            Colors.black.value: ["assets/images/related1.webp"],
            Colors.pink.value: ["assets/images/related2.webp"],
            Colors.pink.value: ["assets/images/related3.webp"]
          },
          itemSizes: ["S","M","L","XL","2XL"],
          categories: ["Women","Blouses"]
      ),
    ],
    "Jackets & Hoodies":[
      ItemDetails(
          itemName: "Jackets",
          itemPrice: 26.8,
          itemIsLove: false,
          itemDescription:
          "Here you can choose things for any wardrobe, even change your style",
          itemColorsPhotos: {
            Colors.brown.value: ["assets/images/womenja1.webp","assets/images/womenja2.webp","assets/images/womenja3.webp","assets/images/womenja4.webp"],
            Colors.blue.value: ["assets/images/womenja11.webp","assets/images/womenja12.webp","assets/images/womenja13.webp","assets/images/womenja14.webp"],
          },
          itemSizes: ["S","M","L","XL","2XL"],
          categories: ["Women","Jackets"]
      ),
      ItemDetails(
          itemName: "Hoodies",
          itemPrice: 50.6,
          itemIsLove: true,
          itemDescription:
          "Here you can choose things for any wardrobe, even change your style",
          itemColorsPhotos: {
            Colors.yellow.value: ["assets/images/related9.webp","assets/images/related11.webp"],
            Colors.blue.value: ["assets/images/related12.webp"]
          },
          itemSizes: ["S","M","L","XL","2XL"],
          categories: ["Women","Hoodies"]
      ),
    ],
    "Pullovers":[
      ItemDetails(
          itemName: "Pullover 1",
          itemPrice: 81,
          itemIsLove: false,
          itemDescription:
          "Here you can choose things for any wardrobe, even change your style",
          itemColorsPhotos: {
            Colors.blue.value: ["assets/images/womenpull1.webp","assets/images/womenpull2.webp","assets/images/womenpull3.webp"],
            Colors.yellow.value: ["assets/images/womenpull11.webp","assets/images/womenpull12.webp","assets/images/womenpull13.webp"],
          },
          itemSizes: ["S","M","L","XL"],
          categories: ["Women","Pullovers"]
      ),
      ItemDetails(
          itemName: "Pullover 2",
          itemPrice: 92,
          itemIsLove: true,
          itemDescription:
          "Here you can choose things for any wardrobe",
          itemColorsPhotos: {
            Colors.red.value: ["assets/images/womnpull.jpeg"]
          },
          itemSizes: ["S","M","L","XL","2XL","3XL"],
          categories: ["Women","Pullovers"]
      ),
    ],
    "Dresses":[
      ItemDetails(
          itemName: "Dress 1",
          itemPrice: 46,
          itemIsLove: true,
          itemDescription:
          "Here you can choose things for any wardrobe, even change your style",
          itemColorsPhotos: {
            Colors.brown.value: ["assets/images/womends1.webp","assets/images/womends2.webp","assets/images/womends3.webp",],
            Colors.red.value: ["assets/images/womends11.webp","assets/images/womends12.webp","assets/images/womends13.webp",],
            Colors.redAccent.value: ["assets/images/womends21.webp","assets/images/womends22.webp","assets/images/womends23.webp",]
          },
          itemSizes: ["S","M","L","XL","2XL"],
          categories: ["Women","Dresses"]
      ),
      ItemDetails(
          itemName: "Dress 2",
          itemPrice: 100,
          itemIsLove: true,
          itemDescription:
          "Here you can choose things for any wardrobe",
          itemColorsPhotos: {
            Colors.white24.value: ["assets/images/womenh1.webp","assets/images/womenh2.webp","assets/images/womenh3.webp",],
            Colors.red.value: ["assets/images/womenh11.webp","assets/images/womenh12.webp","assets/images/womenh13.webp",],
          },
          itemSizes: ["S","M","L","XL","2XL"],
          categories: ["Women","Dresses"]
      ),
    ],
    "Pants & Jeans":[
      ItemDetails(
          itemName: "Pant 1",
          itemPrice: 10,
          itemIsLove: false,
          itemDescription:
          "Here you can choose things for any wardrobe, even change your style",
          itemColorsPhotos: {
            Colors.black.value: ["assets/images/womenp1.webp","assets/images/womenp2.webp","assets/images/womenp3.webp",],
            Colors.brown.value: ["assets/images/womenp11.webp","assets/images/womenp12.webp","assets/images/womenp13.webp",],
          },
          itemSizes: ["S","M","L","XL","2XL"],
          categories: ["Women","Pants"]
      ),
      ItemDetails(
          itemName: "Jeans 2",
          itemPrice: 15,
          itemIsLove: false,
          itemDescription:
          "Here you can choose things for any wardrobe,",
          itemColorsPhotos: {
            Colors.blue.value: ["assets/images/womenjeans1.webp","assets/images/womenjeans2.webp","assets/images/womenjeans3.webp",],
          },
          itemSizes: ["S","M","L","XL","2XL"],
          categories: ["Women","Jeans"]
      ),
    ],
    "Shorts & Pyjama":[
      ItemDetails(
          itemName: "Short",
          itemPrice: 10,
          itemIsLove: false,
          itemDescription:
          "Here you can choose things for any wardrobe, even change your style",
          itemColorsPhotos: {
            Colors.brown.value: ["assets/images/womenshort1.webp","assets/images/womenshort2.webp","assets/images/womenshort3.webp","assets/images/womenshort4.webp",],
            Colors.red.value: ["assets/images/womenshort11.webp","assets/images/womenshort12.webp","assets/images/womenshort13.webp",],
          },
          itemSizes: ["S","M","L","XL","2XL"],
          categories: ["Women","Shorts"]
      ),
      ItemDetails(
          itemName: "Pyjama",
          itemPrice: 60,
          itemIsLove: false,
          itemDescription:
          "Here you can choose things for any wardrobe,",
          itemColorsPhotos: {
            Colors.red.value: ["assets/images/womenpy1.webp","assets/images/womenpy2.webp","assets/images/womenpy3.webp"],
          },
          itemSizes: ["S","M","L","XL","2XL"],
          categories: ["Women","Pyjama"]
      ),
    ]
  };

  static Map<String, List<ItemDetails>> menDetailsCategories = {
    "Jackets & Sweatshirts": [
      ItemDetails(
          itemName: "Jacket 12",
          itemPrice: 19.99,
          itemIsLove: false,
          itemDescription:
          "Here you can choose things for any wardrobe, even change your style",
          itemColorsPhotos: {
            Colors.black.value: ["assets/images/menjacket.jpeg"],
          },
          itemSizes: ["S","M","L","XL","2XL"],
          categories: ["Men","Jackets"]
      ),
      ItemDetails(
          itemName: "Sweatshirt 155",
          itemPrice: 30.5,
          itemIsLove: false,
          itemDescription:
          "Here you can choose things",
          itemColorsPhotos: {
            Colors.green.value: ["assets/images/mensweatshirt.jpeg"],
          },
          itemSizes: ["S","M","L","XL","2XL"],
          categories: ["Men","Sweatshirts"]
      ),
    ],
    "Shirts & Tees":[
      ItemDetails(
          itemName: "Shirt 110",
          itemPrice: 26.8,
          itemIsLove: false,
          itemDescription:
          "Here you can choose things for any wardrobe, even change your style",
          itemColorsPhotos: {
            Colors.yellow.value: ["assets/images/menshirt2.jpg"]
          },
          itemSizes: ["S","M","L","XL","2XL"],
          categories: ["Men","Shirts"]
      ),
      ItemDetails(
          itemName: "Tees 108",
          itemPrice: 50.6,
          itemIsLove: true,
          itemDescription:
          "Here you can choose things for any wardrobe, even change your style",
          itemColorsPhotos: {
            Colors.red.value: ["assets/images/mentees2.jpg"]
          },
          itemSizes: ["S","M","L","XL","2XL"],
          categories: ["Men","Tees"]
      ),
    ],
    "Co-ords & Pyjama":[
      ItemDetails(
          itemName: "CO-ORDS 1",
          itemPrice: 81,
          itemIsLove: false,
          itemDescription:
          "Here you can choose things for any wardrobe, even change your style",
          itemColorsPhotos: {
            Colors.yellow.value: ["assets/images/menco.jpeg"]
          },
          itemSizes: ["S","M","L","XL"],
          categories: ["Men","Co-ords"]
      ),
      ItemDetails(
          itemName: "Pyjama 105",
          itemPrice: 92,
          itemIsLove: true,
          itemDescription:
          "Here you can choose things for any wardrobe",
          itemColorsPhotos: {
            Colors.red.value: ["assets/images/menpolo.jpeg"]
          },
          itemSizes: ["S","M","L","XL","2XL","3XL"],
          categories: ["Men","Pyjama"]
      ),
    ],
    "Jeans  & Pants":[
      ItemDetails(
          itemName: "Jeans 156",
          itemPrice: 90,
          itemIsLove: true,
          itemDescription:
          "Here you can choose things for any wardrobe, even change your style",
          itemColorsPhotos: {
            Colors.amber.value: ["assets/images/menjeans2.jpeg"]
          },
          itemSizes: ["S","M","L","XL","2XL"],
          categories: ["Men","Jeans"]
      ),
      ItemDetails(
          itemName: "pant 15",
          itemPrice: 29,
          itemIsLove: true,
          itemDescription:
          "Here you can choose things for any wardrobe",
          itemColorsPhotos: {
            Colors.red.value: ["assets/images/menpants2.jpg"]
          },
          itemSizes: ["S","M","L","XL","2XL"],
          categories: ["Men","Pants"]
      ),
    ],
    "Underwear & Shorts":[
      ItemDetails(
          itemName: "Underwear 125",
          itemPrice: 10,
          itemIsLove: false,
          itemDescription:
          "Here you can choose things for any wardrobe, even change your style",
          itemColorsPhotos: {
            Colors.amber.value: ["assets/images/menunder.jpeg"]
          },
          itemSizes: ["S","M","L","XL","2XL"],
          categories: ["Men","Underwear"]
      ),
      ItemDetails(
          itemName: "Short 1052",
          itemPrice: 15,
          itemIsLove: false,
          itemDescription:
          "Here you can choose things for any wardrobe,",
          itemColorsPhotos: {
            Colors.red.value: ["assets/images/menswim1.jpeg"]
          },
          itemSizes: ["S","M","L","XL","2XL"],
          categories: ["Men","Shorts"]
      ),
    ],

  };

  static Map<String, List<ItemDetails>> girlsDetailsCategories = {
    "Jackets & Sweatshirts": [
      ItemDetails(
          itemName: "Jacket 12",
          itemPrice: 19.99,
          itemIsLove: false,
          itemDescription:
          "Here you can choose things for any wardrobe, even change your style",
          itemColorsPhotos: {
            Colors.black.value: ["assets/images/girljacket.jpeg"],
          },
          itemSizes: ["S","M","L","XL","2XL"],
          categories: ["Girls","Jackets"]
      ),
      ItemDetails(
          itemName: "Sweatshirt 155",
          itemPrice: 30.5,
          itemIsLove: false,
          itemDescription:
          "Here you can choose things",
          itemColorsPhotos: {
            Colors.green.value: ["assets/images/girlsweat.jpeg"]
          },
          itemSizes: ["S","M","L","XL","2XL"],
          categories: ["Girls","Sweatshirts"]
      ),
    ],
    "Shirts & Blouses":[
      ItemDetails(
          itemName: "Shirt 110",
          itemPrice: 26.8,
          itemIsLove: false,
          itemDescription:
          "Here you can choose things for any wardrobe, even change your style",
          itemColorsPhotos: {
            Colors.yellow.value: ["assets/images/girltshirt.jpeg"]
          },
          itemSizes: ["S","M","L","XL","2XL"],
          categories: ["Girls","Shirts"]
      ),
      ItemDetails(
          itemName: "Blouse 108",
          itemPrice: 50.6,
          itemIsLove: true,
          itemDescription:
          "Here you can choose things for any wardrobe, even change your style",
          itemColorsPhotos: {
            Colors.red.value: ["assets/images/girlblouse.jpeg"]
          },
          itemSizes: ["S","M","L","XL","2XL"],
          categories: ["Girls","Blouse"]
      ),
    ],
    "Home & Pyjama":[
      ItemDetails(
          itemName: "Home 1",
          itemPrice: 81,
          itemIsLove: false,
          itemDescription:
          "Here you can choose things for any wardrobe, even change your style",
          itemColorsPhotos: {
            Colors.yellow.value: ["assets/images/girlhome.jpeg"]
          },
          itemSizes: ["S","M","L","XL"],
          categories: ["Girls","Home"]
      ),
      ItemDetails(
          itemName: "Pyjama 105",
          itemPrice: 92,
          itemIsLove: true,
          itemDescription:
          "Here you can choose things for any wardrobe",
          itemColorsPhotos: {
            Colors.red.value: ["assets/images/girlhome.jpeg"]
          },
          itemSizes: ["S","M","L","XL","2XL","3XL"],
          categories: ["Girls","Pyjama"]
      ),
    ],
    "Skirts & Dresses":[
      ItemDetails(
          itemName: "Skirt 125",
          itemPrice: 10,
          itemIsLove: false,
          itemDescription:
          "Here you can choose things for any wardrobe, even change your style",
          itemColorsPhotos: {
            Colors.amber.value: ["assets/images/girlskirt.jpeg"]
          },
          itemSizes: ["S","M","L","XL","2XL"],
          categories: ["Girls","Skirts"]
      ),
      ItemDetails(
          itemName: "Dress 1052",
          itemPrice: 15,
          itemIsLove: false,
          itemDescription:
          "Here you can choose things for any wardrobe,",
          itemColorsPhotos: {
            Colors.red.value: ["assets/images/girldress1.jpeg"]
          },
          itemSizes: ["S","M","L","XL","2XL"],
          categories: ["Girls","Dresses"]
      ),
    ],
    "Jeans  & Pants":[
      ItemDetails(
          itemName: "Jeans 156",
          itemPrice: 90,
          itemIsLove: true,
          itemDescription:
          "Here you can choose things for any wardrobe, even change your style",
          itemColorsPhotos: {
            Colors.amber.value: [ "assets/images/girljeans.jpeg"]
          },
          itemSizes: ["S","M","L","XL","2XL"],
          categories: ["Girls","Jeans"]
      ),
      ItemDetails(
          itemName: "pant 15",
          itemPrice: 29,
          itemIsLove: true,
          itemDescription:
          "Here you can choose things for any wardrobe",
          itemColorsPhotos: {
            Colors.red.value: ["assets/images/girlpant.jpeg"]
          },
          itemSizes: ["S","M","L","XL","2XL"],
          categories: ["Girls","Pants"]
      ),
    ],
  };

  static Map<String, List<ItemDetails>> boysDetailsCategories = {
    "Jackets": [
      ItemDetails(
          itemName: "Jacket 12",
          itemPrice: 19.99,
          itemIsLove: false,
          itemDescription:
          "Here you can choose things for any wardrobe, even change your style",
          itemColorsPhotos: {
            Colors.black.value: ["assets/images/boyjacket.jpeg"],
          },
          itemSizes: ["S","M","L","XL","2XL"],
          categories: ["Boys","Jackets"]
      ),
      ItemDetails(
          itemName: "Jacket 155",
          itemPrice: 30.5,
          itemIsLove: false,
          itemDescription:
          "Here you can choose things",
          itemColorsPhotos: {
            Colors.green.value: ["assets/images/boyjacket.jpeg"]
          },
          itemSizes: ["S","M","L","XL","2XL"],
          categories: ["Boys","Jackets"]
      ),
    ],
    "Shirts & Poloshirts":[
      ItemDetails(
          itemName: "Shirt 110",
          itemPrice: 26.8,
          itemIsLove: false,
          itemDescription:
          "Here you can choose things for any wardrobe, even change your style",
          itemColorsPhotos: {
            Colors.yellow.value: ["assets/images/boyshirt.jpeg"]
          },
          itemSizes: ["S","M","L","XL","2XL"],
          categories: ["Boys","Shirts"]
      ),
      ItemDetails(
          itemName: "Poloshirt 108",
          itemPrice: 50.6,
          itemIsLove: true,
          itemDescription:
          "Here you can choose things for any wardrobe, even change your style",
          itemColorsPhotos: {
            Colors.red.value: ["assets/images/boypolo.jpeg"]
          },
          itemSizes: ["S","M","L","XL","2XL"],
          categories: ["Boys","Poloshirts"]
      ),
    ],
    "Home & Pyjama":[
      ItemDetails(
          itemName: "Home 1",
          itemPrice: 81,
          itemIsLove: false,
          itemDescription:
          "Here you can choose things for any wardrobe, even change your style",
          itemColorsPhotos: {
            Colors.yellow.value: ["assets/images/boyhome.jpeg"]
          },
          itemSizes: ["S","M","L","XL"],
          categories: ["Boys","Home"]
      ),
      ItemDetails(
          itemName: "Pyjama 105",
          itemPrice: 92,
          itemIsLove: true,
          itemDescription:
          "Here you can choose things for any wardrobe",
          itemColorsPhotos: {
            Colors.red.value: [ "assets/images/boytshirt.jpeg"]
          },
          itemSizes: ["S","M","L","XL","2XL","3XL"],
          categories: ["Boys","Pyjama"]
      ),
    ],
    "Jeans  & Pants":[
      ItemDetails(
          itemName: "Jeans 156",
          itemPrice: 90,
          itemIsLove: true,
          itemDescription:
          "Here you can choose things for any wardrobe, even change your style",
          itemColorsPhotos: {
            Colors.amber.value: ["assets/images/boyjeans.jpeg"]
          },
          itemSizes: ["S","M","L","XL","2XL"],
          categories: ["Boys","Jeans"]
      ),
      ItemDetails(
          itemName: "pant 15",
          itemPrice: 29,
          itemIsLove: true,
          itemDescription:
          "Here you can choose things for any wardrobe",
          itemColorsPhotos: {
            Colors.red.value: ["assets/images/boypant.jpeg"]
          },
          itemSizes: ["S","M","L","XL","2XL"],
          categories: ["Boys","Pants"]
      ),
    ],
    "Knitwear & Swimwear":[
      ItemDetails(
          itemName: "Knitwear 125",
          itemPrice: 10,
          itemIsLove: false,
          itemDescription:
          "Here you can choose things for any wardrobe, even change your style",
          itemColorsPhotos: {
            Colors.amber.value: ["assets/images/boykn.jpeg"]
          },
          itemSizes: ["S","M","L","XL","2XL"],
          categories: ["Boys","Knitwear"]
      ),
      ItemDetails(
          itemName: "Swimwear 1052",
          itemPrice: 15,
          itemIsLove: false,
          itemDescription:
          "Here you can choose things for any wardrobe,",
          itemColorsPhotos: {
            Colors.red.value: ["assets/images/boyswim.jpeg"]
          },
          itemSizes: ["S","M","L","XL","2XL"],
          categories: ["Boys","Swimwear"]
      ),
    ],
  };

  static Map<String, List<ItemDetails>> beautyDetailsCategories = {
    "Face & Skin": [
      ItemDetails(
          itemName: "Face 12",
          itemPrice: 19.99,
          itemIsLove: false,
          itemDescription:
          "Here you can choose things for any wardrobe, even change your style",
          itemColorsPhotos: {
            Colors.black.value: [ "assets/images/beautyface.jpeg"],
          },
          itemSizes: [],
          categories: ["Beauty","Face"]
      ),
      ItemDetails(
          itemName: "Skin 155",
          itemPrice: 30.5,
          itemIsLove: false,
          itemDescription:
          "Here you can choose things",
          itemColorsPhotos: {
            Colors.green.value: ["assets/images/beautyskin.jpeg"]
          },
          itemSizes: [],
          categories: ["Beauty","Skin"]
      ),
    ],
    "Eyes & Lips":[
      ItemDetails(
          itemName: "Eyes 110",
          itemPrice: 26.8,
          itemIsLove: false,
          itemDescription:
          "Here you can choose things for any wardrobe, even change your style",
          itemColorsPhotos: {
            Colors.black.value: ["assets/images/beautyeye.jpeg"],
            Colors.yellow.value: ["assets/images/beautyeye.jpeg"],
            Colors.lightBlue.value: ["assets/images/beautyeye.jpeg"],
            Colors.deepOrangeAccent.value: ["assets/images/beautyeye.jpeg"],
            Colors.pinkAccent.value: ["assets/images/beautyeye.jpeg"],
            Colors.lightBlueAccent.value: ["assets/images/beautyeye.jpeg"],
          },
          itemSizes: [],
          categories: ["Beauty","Eyes"]
      ),
      ItemDetails(
          itemName: "Lips 108",
          itemPrice: 50.6,
          itemIsLove: true,
          itemDescription:
          "Here you can choose things for any wardrobe, even change your style",
          itemColorsPhotos: {
            Colors.red.value: ["assets/images/beautylips.png"]
          },
          itemSizes: [],
          categories: ["Beauty","Lips"]
      ),
    ],
    "Nails & Hair":[
      ItemDetails(
          itemName: "Nail 1",
          itemPrice: 81,
          itemIsLove: false,
          itemDescription:
          "Here you can choose things for any wardrobe, even change your style",
          itemColorsPhotos: {
            Colors.yellow.value: ["assets/images/beautynails.jpeg"]
          },
          itemSizes: [],
          categories: ["Beauty","Nails"]
      ),
      ItemDetails(
          itemName: "Hair 105",
          itemPrice: 92,
          itemIsLove: true,
          itemDescription:
          "Here you can choose things for any wardrobe",
          itemColorsPhotos: {
            Colors.red.value: ["assets/images/beautyhair.jpeg"]
          },
          itemSizes: [],
          categories: ["Beauty","Hair"]
      ),
    ],
    "Fragrances":[
      ItemDetails(
          itemName: "Fragrances 1",
          itemPrice: 90,
          itemIsLove: true,
          itemDescription:
          "Here you can choose things for any wardrobe, even change your style",
          itemColorsPhotos: {
            Colors.lightBlueAccent.value: ["assets/images/beautyfrag.jpeg"]
          },
          itemSizes: [],
          categories: ["Beauty","Fragrances"]
      ),
      ItemDetails(
          itemName: "Fragrances 2",
          itemPrice: 29,
          itemIsLove: true,
          itemDescription:
          "Here you can choose things for any wardrobe",
          itemColorsPhotos: {
            Colors.pinkAccent.value: ["assets/images/beautyfragrance.jpeg"]
          },
          itemSizes: [],
          categories: ["Beauty","Fragrances"]
      ),
    ],
    "Accessories":[
      ItemDetails(
          itemName: "Acc 125",
          itemPrice: 10,
          itemIsLove: false,
          itemDescription:
          "Here you can choose things for any wardrobe, even change your style",
          itemColorsPhotos: {
            Colors.indigo.value: ["assets/images/beautyacc.jpeg"]
          },
          itemSizes: [],
          categories: ["Beauty","Accessories"]
      ),
      ItemDetails(
          itemName: "Acc 1052",
          itemPrice: 15,
          itemIsLove: false,
          itemDescription:
          "Here you can choose things for any wardrobe,",
          itemColorsPhotos: {
            Colors.lightGreen.value: ["assets/images/beautyacc.jpeg"]
          },
          itemSizes: [],
          categories: ["Beauty","Accessories"]
      ),
    ],
    "Kits & Tools":[
      ItemDetails(
          itemName: "Kit 125",
          itemPrice: 10,
          itemIsLove: false,
          itemDescription:
          "Here you can choose things for any wardrobe, even change your style",
          itemColorsPhotos: {
            Colors.deepOrangeAccent.value: ["assets/images/beautykit.jpeg"]
          },
          itemSizes: [],
          categories: ["Beauty","Kits"]
      ),
      ItemDetails(
          itemName: "Tool 1052",
          itemPrice: 15,
          itemIsLove: false,
          itemDescription:
          "Here you can choose things for any wardrobe,",
          itemColorsPhotos: {
            Colors.red.value: ["assets/images/beautytools.jpeg"]
          },
          itemSizes: [],
          categories: ["Beauty","Tools"]
      ),
    ],
  };

  static Map<String, List<ItemDetails>> shoesDetailsCategories = {
    "Casual & Formal": [
      ItemDetails(
          itemName: "Casual 12",
          itemPrice: 19.99,
          itemIsLove: false,
          itemDescription:
          "Here you can choose things for any wardrobe, even change your style",
          itemColorsPhotos: {
            Colors.black.value: ["assets/images/scasual.jpeg"],
          },
          itemSizes: ["38","39","40","41","42"],
          categories: ["Shoes","Casual"]
      ),
      ItemDetails(
          itemName: "Formal 155",
          itemPrice: 30.5,
          itemIsLove: false,
          itemDescription:
          "Here you can choose things",
          itemColorsPhotos: {
            Colors.green.value: ["assets/images/sformal.jpeg"]
          },
          itemSizes: ["38","39","40","41","42"],
          categories: ["Shoes","Formal"]
      ),
    ],
    "Boots":[
      ItemDetails(
          itemName: "Boot 110",
          itemPrice: 26.8,
          itemIsLove: false,
          itemDescription:
          "Here you can choose things for any wardrobe, even change your style",
          itemColorsPhotos: {
            Colors.yellow.value: ["assets/images/sboots.jpeg"]
          },
          itemSizes: ["38","39","40","41","42"],
          categories: ["Shoes","Boots"]
      ),
      ItemDetails(
          itemName: "Boot 108",
          itemPrice: 50.6,
          itemIsLove: true,
          itemDescription:
          "Here you can choose things for any wardrobe, even change your style",
          itemColorsPhotos: {
            Colors.red.value: ["assets/images/smenboot.jpeg"]
          },
          itemSizes: ["38","39","40","41","42"],
          categories: ["Shoes","Boots"]
      ),
    ],
    "Sport shoes":[
      ItemDetails(
          itemName: "Sport 1",
          itemPrice: 81,
          itemIsLove: false,
          itemDescription:
          "Here you can choose things for any wardrobe, even change your style",
          itemColorsPhotos: {
            Colors.yellow.value: ["assets/images/ssport.jpeg"]
          },
          itemSizes: ["38","39","40","41","42"],
          categories: ["Shoes","Sport shoes"]
      ),
      ItemDetails(
          itemName: "Sport 105",
          itemPrice: 92,
          itemIsLove: true,
          itemDescription:
          "Here you can choose things for any wardrobe",
          itemColorsPhotos: {
            Colors.red.value: ["assets/images/smensport.jpeg"]
          },
          itemSizes: ["38","39","40","41","42"],
          categories: ["Shoes","Sport shoes"]
      ),
    ],
    "Heels":[
      ItemDetails(
          itemName: "Heel 1",
          itemPrice: 90,
          itemIsLove: true,
          itemDescription:
          "Here you can choose things for any wardrobe, even change your style",
          itemColorsPhotos: {
            Colors.amber.value: ["assets/images/sheels.jpeg"]
          },
          itemSizes: ["38","39","40","41","42"],
          categories: ["Shoes","Heels"]
      ),
      ItemDetails(
          itemName: "Heel 2",
          itemPrice: 29,
          itemIsLove: true,
          itemDescription:
          "Here you can choose things for any wardrobe",
          itemColorsPhotos: {
            Colors.red.value: ["assets/images/sheels.jpeg"]
          },
          itemSizes: ["38","39","40","41","42"],
          categories: ["Shoes","Heels"]
      ),
    ],
    "Sandals & Slipper":[
      ItemDetails(
          itemName: "Sandals 125",
          itemPrice: 10,
          itemIsLove: false,
          itemDescription:
          "Here you can choose things for any wardrobe, even change your style",
          itemColorsPhotos: {
            Colors.amber.value: ["assets/images/ssandals.png"]
          },
          itemSizes: ["38","39","40","41","42"],
          categories: ["Shoes","Sandals"]
      ),
      ItemDetails(
          itemName: "Slipper 1052",
          itemPrice: 15,
          itemIsLove: false,
          itemDescription:
          "Here you can choose things for any wardrobe,",
          itemColorsPhotos: {
            Colors.red.value: ["assets/images/sslipper.jpeg"]
          },
          itemSizes: ["38","39","40","41","42"],
          categories: ["Shoes","Slipper"]
      ),
    ],
  };
}