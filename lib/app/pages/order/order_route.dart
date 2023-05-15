import 'package:delivery_app/app/pages/order/order_controller.dart';
import 'package:delivery_app/app/pages/order/order_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OrderRoute {
  OrderRoute._();

  static Widget get page => MultiProvider(
        providers: [
          Provider(
            create: (context) => OrderController(),
          ),
        ],
        child: const OrderPage(),
      );
}
