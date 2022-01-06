

import 'package:panshimanager/data_layer/models/item_details.dart';

class CartItemDetails{
  ItemDetails itemDetails;
  int selectedColor;
  String selectedSize;
  CartItemDetails({
        required this.itemDetails,
        required this.selectedColor,
        required this.selectedSize
      });
}