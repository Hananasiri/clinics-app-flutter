import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import '../../../Logic/Controller/product_controller.dart';
import '../../../Model/product.dart';
import '../../widgets/user/favouites/products_favourite.dart';
import '../../widgets/user/popupMenu/cart_item_customer.dart';
import '../../widgets/user/popupMenu/searchProducts.dart';

class CustomerHome extends StatelessWidget {
  CustomerHome({Key? key}) : super(key: key);
  final controller = Get.put(ProdectController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        toolbarHeight: 145,
        iconTheme: IconThemeData(color: Colors.black),
        title: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text(
            "Dental Clinics",
            style: TextStyle(
              color: Colors.black,
              fontSize: 20.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
        ]),
        elevation: 0,
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              print(controller.favouritesList);
              Get.to(prodectsFavourites());
            },
            icon: Icon(
              Icons.mark_email_read_sharp,
              color: Colors.black,
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          SizedBox(
            height: 2.h,
          ),
          StreamBuilder(
            stream: controller.getData,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                controller.prodects = snapshot.data!.docs
                    .map((e) => Prodect(
                    productNumber: e['productNumber'],
                    productName: e['productName'],
                    category: e['category'],
                    quantity: e['quantity'],
                    price: e['price'],
                    description: e['description'],
                    imageUrl: e['imageUrl']))
                    .toList();

                print('leeength ${controller.prodects.length}');
                if (controller.prodects.isNotEmpty) {
                  return CardItem(prodects: controller.prodects);
                } else {
                  return Text("No thing");
                }
              } else {
                return CardItem(prodects: controller.prodects);
              }
            },
          ),
        ],
      ),
    );
  }
}
