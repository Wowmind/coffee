import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:starbucks/controllers/bucks_controller.dart';
import 'package:starbucks/models/models.dart';
import 'package:starbucks/views/cart_total.dart';

class CartScreen extends StatelessWidget {
  final BucksController controller = Get.find();
  CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Color(0xFFECEFF1) ,
      appBar: AppBar(
        backgroundColor: Color(0xFFECEFF1),
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back, color: Colors.black,),
        ),
        title: const Text('Shopping Cart',
        style: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 20,
          color:  Colors.black
        ),
        ),
        centerTitle: true,
      ),
      body: Obx(
            () => Padding(
          padding: const EdgeInsets.only(left: 10, right: 10, bottom: 90),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Order Summary',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),),

              const SizedBox(
                height: 20,
              ),

              Expanded(
                child: ListView.builder(
                    itemCount: controller.product.length,
                    itemBuilder: (context, index){
                      return CartProduct(
                        controller: controller,
                        product: controller.product.keys.toList()[index],
                        quantity: controller.product.values.toList()[index],
                        index: index,
                      );
                    }),
              ),
              CartTotal(),
            ],
          ),
        ),
      ),
    );
  }
}

class CartProduct extends StatelessWidget {
  final BucksController controller;
  final Product product;
  final int quantity;
  final int index;
  const CartProduct(
      {Key? key,
      required this.controller,
        required this.product,
        required this.quantity,
        required this.index,
      }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20),
      padding: EdgeInsets.only(left: 15),
      height: 130,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Color(0xFF8BC34A),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [

          Container(
            height: 80,
            width: 80,
            decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(Product.product[index].img),
                )
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 30,),
              Text(Product.product[index].name, style: TextStyle(fontSize: 12, color: Colors.black, fontWeight: FontWeight.bold),),

              const SizedBox(height: 40,),

              Row(
                children: [
                  Text(
                    '\$${Product.product[index].price}',
                    style: TextStyle(
                        fontSize: 15,
                        color: Colors.black,
                        fontWeight: FontWeight.w500),),
                  const SizedBox(width: 10,),

                  Container(
                    height: 35,
                    width: 180,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                         IconButton(onPressed: (){
                           controller.addProduct(product);
                         }, icon: Icon(Icons.add_circle_outline)
                            ),


                        Text('${quantity}',
                          style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w700,
                            fontSize: 12,
                          ),),

                        IconButton(onPressed: (){
                          controller.removedProduct(product);
                        }, icon: Icon(Icons.remove_circle_outline),
                        ),


                      ],
                    ),
                  )
                ],

              ),

            ],
          )

        ],
      ),

    );
  }
}
