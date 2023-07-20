import 'package:flutter/material.dart';
import 'package:third_exam/services/model/product_model.dart';
import 'package:third_exam/ui/all_products_page/all_products.dart';
import 'package:third_exam/ui/all_products_page/widget/islikedd.dart';
import 'package:third_exam/ui/cart_page/cart_page.dart';
import 'package:third_exam/ui/home/home_page.dart';
import 'package:third_exam/ui/id-products/byid_products.dart';
import 'package:third_exam/ui/like_page/like_page.dart';
import 'package:third_exam/ui/tab_bar/tab_bar.dart';

class RouteNames {
  static const String tabscreen = "/";
  static const String homePage = "/homePage";
  static const String allProducts = "/allProducts";
  static const String cartPage = "/cartPage";
  static const String productsByID = "/productsByID";
  static const String likePage = "/likePage";
  static const String alllikePage = "/alllikePage";
}

class AppRoutes {
  static Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteNames.tabscreen:
        return MaterialPageRoute(builder: (context) => Tabscreen());
      case RouteNames.homePage:
        return MaterialPageRoute(builder: (context) => HomePage());
      case RouteNames.allProducts:
        return MaterialPageRoute(builder: (context) => AllProducts());
      case RouteNames.cartPage:
        return MaterialPageRoute(builder: (context) => CartPage());
      // case RouteNames.alllikePage:
      //   return MaterialPageRoute(
      //       builder: (context) => AllLikedd(
      //             i: settings.arguments as InnerProductModel,
      //           ));
      case RouteNames.likePage:
      return MaterialPageRoute(builder: (context) => LikePage());
      case RouteNames.productsByID:
        return MaterialPageRoute(
            builder: (context) => ProductsByID(id: settings.arguments as int?));
      ///////////////////////////////////////////////////////////////
      //following code shows us how to sen parametrs to widget

      // case RouteNames.addContact:
      //   return MaterialPageRoute(builder: (context) {
      //     return AddContactScreen(
      //       listener: settings.arguments as VoidCallback,
      //     );
      //   });
      /////////////////////////////////////////////////////////////

      default:
        return MaterialPageRoute(
          builder: (context) => const Scaffold(
            body: Center(
              child: Text("Route mavjud emas"),
            ),
          ),
        );
    }
  }
}
