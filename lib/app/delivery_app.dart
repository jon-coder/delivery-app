import 'package:delivery_app/app/pages/auth/login/login_page.dart';
import 'package:delivery_app/app/pages/auth/register/register_route.dart';
import 'package:delivery_app/app/pages/product_detail/product_detail_route.dart';
import 'package:flutter/material.dart';

import 'package:delivery_app/app/core/provider/application_binding.dart';
import 'package:delivery_app/app/core/ui/theme/theme_config.dart';
import 'package:delivery_app/app/pages/home/home_route.dart';
import 'package:delivery_app/app/pages/splash/splash_page.dart';

class DeliveryApp extends StatelessWidget {
  const DeliveryApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ApplicationBinding(
      child: MaterialApp(
        title: 'Delivery App',
        theme: ThemeConfig.theme,
        routes: {
          '/': (context) => const SplashPage(),
          '/home': (context) => HomeRoute.page,
          '/productDetail': (context) => ProductDetailRoute.page,
          '/auth/login': (context) => const LoginPage(),
          '/auth/register': (context) => RegisterRoute.page,
        },
      ),
    );
  }
}
