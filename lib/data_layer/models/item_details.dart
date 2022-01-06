
class ItemDetails{
  Map<int,List<String>>itemColorsPhotos;
  String itemName,itemDescription;
  double itemPrice;
  bool itemIsLove;
  List<String>itemSizes;
  List<String>categories;
  ItemDetails(
      {required this.itemColorsPhotos,
        required this.itemName,
        required this.itemDescription,
        required this.itemPrice,
        required this.itemIsLove,
        required this.itemSizes,
        required this.categories,
      });
}