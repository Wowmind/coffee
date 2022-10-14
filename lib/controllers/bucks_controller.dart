
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:starbucks/models/models.dart';

class BucksController extends GetxController{

  var _products = {}.obs;


  void addProduct(Product product){
    if(_products.containsKey(product)){
      _products[product] +=1;
    }else {
      _products[product] = 1;

    }

    Get.snackbar(
      'Product Added', 'You have added the ${product.name} to the cart',
      snackPosition: SnackPosition.BOTTOM,
      duration: Duration(seconds: 2),
      backgroundColor: Color(0xFF8BC34A),
    );
  }
  get product => _products;

  void removedProduct(Product product){
    if(_products.containsKey(product)&&_products[product]==1){
      _products.removeWhere((key, value) => key ==product);
    }else{
      _products[product] -=1;
    }
    Get.snackbar(
      'Product Removed', 'You have removed the ${product.name} from the cart',
      snackPosition: SnackPosition.BOTTOM,
      duration: Duration(seconds: 2),
      backgroundColor: Color(0xFF8BC34A),
    );

  }
  get productSubTotal => _products.entries
      .map((product) => product.key.price * product.value)
      .toList();

  get total => _products.entries
      .map((product) => product.key.price * product.value)
      .toList()
      .reduce((value, element) => value + element)
      .toStringAsFixed(2);

  int get count => _products.length;
}