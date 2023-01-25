import 'package:flutter/material.dart';
import 'package:delivery_app/app/core/ui/widgets/delivery_button.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Splash Page'),
      ),
      body: Center(
        child: Column(
          children: [
            DeliveryButton(
              label: 'Teste',
              onPressed: () {},
            ),
            TextFormField(
              decoration: const InputDecoration(label: Text('Test')),
            )
          ],
        ),
      ),
    );
  }
}
