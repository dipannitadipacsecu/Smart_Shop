import 'package:get/get.dart';

import '../modules/all_carts/bindings/all_carts_binding.dart';
import '../modules/all_carts/views/all_carts_view.dart';
import '../modules/all_category/bindings/all_category_binding.dart';
import '../modules/all_category/views/all_category_view.dart';
import '../modules/all_products/bindings/all_products_binding.dart';
import '../modules/all_products/views/all_products_view.dart';
import '../modules/card/bindings/card_binding.dart';
import '../modules/card/views/card_view.dart';
import '../modules/dashboard/bindings/dashboard_binding.dart';
import '../modules/dashboard/views/dashboard_view.dart';
import '../modules/electronics/bindings/electronics_binding.dart';
import '../modules/electronics/views/electronics_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/jwellery/bindings/jwellery_binding.dart';
import '../modules/jwellery/views/jwellery_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/men_clothing/bindings/men_clothing_binding.dart';
import '../modules/men_clothing/views/men_clothing_view.dart';
import '../modules/notification/bindings/notification_binding.dart';
import '../modules/notification/views/notification_view.dart';
import '../modules/pay/bindings/pay_binding.dart';
import '../modules/pay/views/pay_view.dart';
import '../modules/product_details_view.dart/bindings/product_details_view_dart_binding.dart';
import '../modules/product_details_view.dart/views/product_details_view_dart_view.dart';
import '../modules/signup/bindings/signup_binding.dart';
import '../modules/signup/views/signup_view.dart';
import '../modules/women_clothing/bindings/women_clothing_binding.dart';
import '../modules/women_clothing/views/women_clothing_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.LOGIN;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.PRODUCT_DETAILS_VIEW_DART,
      page: () => const ProductDetailsViewDartView(),
      binding: ProductDetailsViewDartBinding(),
    ),
    GetPage(
      name: _Paths.CARD,
      page: () => CardView(),
      binding: CardBinding(),
    ),
    GetPage(
      name: _Paths.PAY,
      page: () => PayView(),
      binding: PayBinding(),
    ),
    GetPage(
      name: _Paths.DASHBOARD,
      page: () => const DashboardView(),
      binding: DashboardBinding(),
    ),
    GetPage(
      name: _Paths.ALL_PRODUCTS,
      page: () => const AllProductsView(),
      binding: AllProductsBinding(),
    ),
    GetPage(
      name: _Paths.ALL_CATEGORY,
      page: () => const AllCategoryView(),
      binding: AllCategoryBinding(),
    ),
    GetPage(
      name: _Paths.ALL_CARTS,
      page: () => const AllCartsView(),
      binding: AllCartsBinding(),
    ),
    GetPage(
      name: _Paths.SIGNUP,
      page: () => const SignupView(),
      binding: SignupBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.JWELLERY,
      page: () => const JwelleryView(),
      binding: JwelleryBinding(),
    ),
    GetPage(
      name: _Paths.ELECTRONICS,
      page: () => const ElectronicsView(),
      binding: ElectronicsBinding(),
    ),
    GetPage(
      name: _Paths.MEN_CLOTHING,
      page: () => const MenClothingView(),
      binding: MenClothingBinding(),
    ),
    GetPage(
      name: _Paths.WOMEN_CLOTHING,
      page: () => const WomenClothingView(),
      binding: WomenClothingBinding(),
    ),
    GetPage(
      name: _Paths.NOTIFICATION,
      page: () => const NotificationView(),
      binding: NotificationBinding(),
    ),
  ];
}
