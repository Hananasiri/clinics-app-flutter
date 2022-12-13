import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import '../../../../Logic/Controller/product_controller.dart';

class CardItem extends StatelessWidget {
  final controller = Get.find<ProdectController>();
  List prodects = [];

  CardItem({Key? key, required this.prodects}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
            itemCount: prodects.length,
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                childAspectRatio: .8,
                mainAxisSpacing: 9.0,
                crossAxisSpacing: 15.0,
                maxCrossAxisExtent: 214),
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(5),
                child: Container(
                  height: 40.h,
                  width: 100.w,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: 100.w,
                          height: 15.h,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Stack(
                            children: [
                              Container(
                                height: 20.h,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                    color: Colors.white.withOpacity(0.3),
                                    borderRadius: BorderRadius.circular(4),
                                    image: DecorationImage(
                                        image: NetworkImage(
                                            '${prodects[index].imageUrl}'),
                                        fit: BoxFit.cover)),
                              ),
                              Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Align(
                                    alignment: Alignment.topRight,
                                    child: InkWell(
                                      onTap: () {
                                        controller.manageFavourites(
                                          prodects[index].productNumber,
                                        );
                                      },
                                      child: Container(
                                        height: 2.h,
                                        width: 5.w,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                            BorderRadius.circular(50),
                                            color: Colors.white),
                                        child: Obx((() {
                                          return controller.isFave(
                                              prodects[index].productNumber)
                                              ? Icon(
                                            Icons.add_box,
                                            size: 15,
                                            color: Colors.red,
                                          )
                                              : Icon(
                                            Icons.add,
                                            size: 15,
                                            color: Colors.black,
                                          );
                                        })),
                                      ),
                                    ),
                                  ))
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              "${prodects[index].productName}",
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                color: Colors.black,
                                fontSize: 16.sp,
                              ),
                            )),
                      ),

                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              "${prodects[index].category}",
                              style: TextStyle(
                                fontWeight: FontWeight.w300,
                                color: Color.fromRGBO(151, 151, 151, 1),
                                fontSize: 10.sp,
                              ),
                            )),
                      ),

                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              " \$ ${prodects[index].price}",
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                color: Colors.black,
                                fontSize: 12.sp,
                              ),
                            ),
                          ],
                        ),
                      ),
                      // Text('${controller.favouritesList[index]['productNumber']}')
                    ],
                  ),
                ),
              );
            }),
      ),
    );
  }
}
