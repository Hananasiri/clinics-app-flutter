import 'package:get/get.dart';

  class CartController extends GetxController {
 var productMap = {}.obs;

  int quantity() {
  if (productMap.isEmpty) {
  return 0;
  } else {
  return productMap.entries
      .map((e) => e.value)
      .toList()
      .reduce((value, element) => value + element);
  }
  }



  }


