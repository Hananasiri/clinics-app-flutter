import 'package:cred_books/View/Screens/Settings/settings_screen.dart';
import 'package:cred_books/View/Screens/admin/stock_screen.dart';
import 'package:get/get.dart';
import '../../View/Screens/Settings/profile.dart';
import '../../View/Screens/user/customer_home.dart';
class MainController extends GetxController {//هذا الملف تابع للبوتوم بار نافيقيشن فيه تدفق معلومات جاي من الفاير بيس فلازم نتسخدم obs
  RxInt currentIndex = 0.obs; //Rx نوع المتغير يصير obs مع ال

  var tabs = [
    StockScreen(),
    CustomerHome(),
    ProfileScreen(),

  ].obs;

  // var title = [
  //   "StockScreen ",
  //   'Favourites',
  //   "Settings",
  // ].obs;

}
