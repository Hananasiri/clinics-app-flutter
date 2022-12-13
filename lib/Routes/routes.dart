import 'package:cred_books/Logic/Bindings/product_binding.dart';
import 'package:get/get.dart';
import '../Logic/Bindings/auth_binding.dart';
import '../View/Screens/Settings/edit_profile_screen.dart';
import '../View/Screens/Settings/forgot_password_screen.dart';
import '../View/Screens/Settings/login_screen.dart';
import '../View/Screens/Settings/profile.dart';
import '../View/Screens/Settings/settings_screen.dart';
import '../View/Screens/Settings/signup_screen.dart';
import '../View/Screens/admin/Add_product_from_screen.dart';
import '../View/Screens/admin/main_screen.dart';
import '../View/Screens/admin/stock_screen.dart';
import '../View/Screens/user/customer_home.dart';
import '../View/Screens/user/login_screen.dart';

class AppRoutes {
  //initialRoute
  // static const stock = Routes.stockScreen;
  static const login = Routes.loginScreen;
  // static const customerHome = Routes.customerHome;
  static const mainScreen = Routes.mainScreen;

  //getPages
  static final routes = [
    GetPage(
      name: Routes.mainScreen,
      page: () =>   MainScreen(),
      bindings: [
        AuthBinding(),
        ProductBinding(),


      ],
    ),
    GetPage(
        name: Routes.stockScreen,
        page: () => StockScreen()
    ),
   // GetPage(name: Routes.logIn, page: () => loginScreen()),
    GetPage(
        name: Routes.loginScreen,
        page: () => Login_Screen(),
        binding: AuthBinding()
    ),
    GetPage(
        name: Routes.addProductForm,
        page: () => AddProductFromScreen()
    ),
    GetPage(name: Routes.customerHome,
        page: () => CustomerHome()
    ),
    GetPage(
        name: Routes.signScreen,
        page: () => SignUpScreen(),
        binding: AuthBinding()
    ),
    GetPage(
        name: Routes.forgotpasswordScreen,
        page: () => ForgotPasswordScreen(),
        binding: AuthBinding()
    ),
    GetPage(
        name: Routes.profileScreen,
        page: () => ProfileScreen(),
        binding: AuthBinding()
    ),
    GetPage(
        name: Routes.editProfileScreen,
        page: () => EditProfileScreen(),
        binding: AuthBinding()
    ),
    GetPage(
        name: Routes.settingsScreen,
        page: () => SettingScreen(),
        binding: AuthBinding()
    )
  ];
}

class Routes {
  static const mainScreen = '/mainScreen';
  static const loginScreen = '/loginScreen';
  static const stockScreen = '/StockScreen';
  static const signScreen = '/signScreen';
  static const forgotpasswordScreen = '/forgotpasswordScreen';
  static const addProductForm = '/AddProductFromScreen';
  static const editProduct = '/EditProductScreen';
  static const customerHome = '/CustomerHome';
  static const profileScreen = '/profileScreen';
  static const settingsScreen = '/settingsScreen';
  static const editProfileScreen = '/editProfileScreen';
}
