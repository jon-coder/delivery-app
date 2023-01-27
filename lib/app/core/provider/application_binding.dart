import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:delivery_app/app/core/rest_client/custom_dio.dart';

class ApplicationBinding extends StatelessWidget {
  final Widget _child;

  const ApplicationBinding({
    super.key,
    required Widget child,
  }) : _child = child;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(
          create: (context) => CustomDio(),
        ),
      ],
      child: _child,
    );
  }
}
