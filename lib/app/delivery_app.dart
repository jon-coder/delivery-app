import 'package:flutter/material.dart';

import 'core/global/global_context.dart';
import 'core/provider/application_binding.dart';
import 'core/ui/theme/theme_config.dart';
import 'pages/home/home_route.dart';
import 'pages/auth/login/login_route.dart';
import 'pages/auth/register/register_route.dart';
import 'pages/order/order_completed_page.dart';
import 'pages/order/order_route.dart';
import 'pages/product_detail/product_detail_route.dart';
import 'pages/splash/splash_page.dart';

class DeliveryApp extends StatelessWidget {
  final _navKey = GlobalKey<NavigatorState>();

  DeliveryApp({super.key}) {
    GlobalContext.i.navigatorKey = _navKey;
  }

  @override
  Widget build(BuildContext context) {
    return ApplicationBinding(
      child: MaterialApp(
        title: 'Delivery App',
        navigatorKey: _navKey,
        theme: ThemeConfig.theme,
        routes: {
          '/': (context) => const SplashPage(),
          '/home': (context) => HomeRoute.page,
          '/productDetail': (context) => ProductDetailRoute.page,
          '/auth/login': (context) => LoginRoute.page,
          '/auth/register': (context) => RegisterRoute.page,
          '/order': (context) => OrderRoute.page,
          '/order/completed': (context) => const OrderCompletedPage(),
        },
      ),
    );
  }
}
