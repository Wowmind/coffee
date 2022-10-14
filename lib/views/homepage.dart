import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:starbucks/controllers/bucks_controller.dart';
import 'package:starbucks/models/models.dart';
import 'package:starbucks/views/cartscreen.dart';
import 'package:starbucks/views/detail_screen.dart';

class Homepage extends StatelessWidget {
   Homepage({Key? key}) : super(key: key);
  final bucksController = Get.put(BucksController());


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFECEFF1),
      appBar:  AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Image.asset('assets/alarm.png', scale: 2,),
        actions: [
          FloatingActionButton.extended(onPressed: () {
            Get.to(CartScreen());
          },
              backgroundColor: Colors.white,
              icon: const Icon(
                Icons.shopping_cart_outlined,
                color: Colors. black, size: 22,),
              label: Obx( ()=> Text(bucksController.count.toString(), style: TextStyle(color: Colors.red),))),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            const Text('Good Evening, Tayelolu', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26, color: Colors.black),),

            const SizedBox(height: 15,),

            const Text('its time for a coffee break', style: TextStyle(fontSize: 16, color: Colors.black, fontWeight: FontWeight.w400),),

            const SizedBox(height: 20,),

            Stack(
              children: [
                Container(
                  height: 120,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Color(0xFF8BC34A),
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                const Positioned(
                    top: 30,
                    left: 20,
                    child:  Text(
                      'Buy 2',
                      style: TextStyle(fontSize: 14, color: Colors.black, fontWeight: FontWeight.bold),)),

               const Positioned(
                    top: 55,
                    left: 20,
                    child:  Text(
                      'Get a Free Cookie!',
                      style: TextStyle(fontSize: 14, color: Colors.black, fontWeight: FontWeight.bold),)),

               const Positioned(
                    top: 90,
                    left: 20,
                    child:  Text('order now', style: TextStyle(fontSize: 14, color: Colors.white, fontWeight: FontWeight.bold),)),

                Positioned(
                    left: 160,

                    child: Image.asset('assets/stac.png', scale: 1,)),

                Positioned(
                    top: 50,
                    left: 230,

                    child: Image.asset('assets/baaa.png', scale: 1)),
              ],
            ),
            const SizedBox(height: 20,),

            const Text('Category', style: TextStyle(fontSize: 14, color: Colors.black, fontWeight: FontWeight.w800),),

            const SizedBox(height: 10,),
            /*

            Expanded(
              child: ListView(
                shrinkWrap: false,
                scrollDirection: Axis.horizontal,
                children: [
                  myList('assets/teacup.png', 'Hot drink'),
                  myList('assets/muffins.png', 'Muffins'),
                  myList('assets/coff.png', 'Drinks'),
                  myList('assets/cheese.png', 'Breakfast'),
                  myList('assets/pizzaa.png', 'Pizza'),
                  myList('assets/teacup.png', 'Hot drink'),
                  myList('assets/muffins.png', 'Muffins'),
                  myList('assets/coff.png', 'Drinks'),
                  myList('assets/cheese.png', 'Breakfast'),
                  myList('assets/pizzaa.png', 'Pizza'),
                ],
              ),
            ),

             */


           Expanded(
             child: GridView.builder(
                        shrinkWrap: false,
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 5.0,
                      mainAxisSpacing: 5.0,
                      childAspectRatio: 1,
                    ),
                        itemCount: Product.product.length,
                        itemBuilder: (context, index){
                          return  Coffee(
                              index: index,
                            product: Product.product[index],
                            );

                        }),
           ),


          ],
        ),
      ),
    );
  }
  /*
  Widget myList(String img, String name){
    return Container(
      margin: EdgeInsets.only(left: 20),
      child: Column(
        children: [
          Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
                color: Colors.white,
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(img),
                )
            ),
          ),
          const SizedBox(height: 10,),
          Center(child: Text(name, style: TextStyle(fontSize: 13, color: Colors.black, fontWeight: FontWeight.w500),)),
        ],
      ),
    );
  }

   */
}

class Coffee extends StatelessWidget {
  final bucksController = Get.put(BucksController());
  final int index;
  final Product product;
   Coffee({Key? key, required this.index, required this.product,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:  () {
        Navigator.push(context, MaterialPageRoute(builder: (context) =>
            DetailScreen(product: Product.product[index], index: index,)));
      },
      child: Container(
        color: Colors.white,
        child: Column(
          children: [
            const SizedBox(height: 10,),
            Container(
              height: 60,
              width: 60,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(Product.product[index].img),
                )
              ),
            ),
            SizedBox(height: 18,),
            Text(Product.product[index].name, style: TextStyle(fontSize: 16, color: Colors.black, fontWeight: FontWeight.bold),),
            SizedBox(height: 15,),
            Padding(
              padding: const EdgeInsets.only(left: 5, right: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('${Product.product[index].price}', style: TextStyle(fontSize: 15, color: Colors.black, fontWeight: FontWeight.w500),),
                  GestureDetector(
                    onTap: () {
                      bucksController.addProduct(Product.product[index]);
                    },
                    child: Container(
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                        color: Color(0xFF8BC34A),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Center(
                        child: Icon(
                          Icons.add, color: Colors.white,
                        )
                      ),
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
}

