import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:starbucks/controllers/bucks_controller.dart';
import 'package:starbucks/models/models.dart';

class DetailScreen extends StatelessWidget {
  DetailScreen({Key? key, required this.index, required this.product}) : super(key: key);
  final Product product;
  final bucksController = Get.put(BucksController());
  final int index;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text(Product.product[index].name),
      ),
    );
  }
}
