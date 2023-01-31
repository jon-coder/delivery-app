import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:delivery_app/app/pages/product_detail/product_detail_page.dart';

class ProductDetailRoute {
  ProductDetailRoute._();

  static Widget get page => MultiProvider(
        providers: [
          Provider(
            create: (_) => Object(),
          ),
        ],
        child: const ProductDetailPage(),
      );
}
