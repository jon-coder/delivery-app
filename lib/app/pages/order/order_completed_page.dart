import 'package:flutter/material.dart';

import 'package:delivery_app/app/core/ui/helpers/size_extensions.dart';
import 'package:delivery_app/app/core/ui/styles/text_styles.dart';
import 'package:delivery_app/app/core/ui/widgets/delivery_button.dart';

class OrderCompletedPage extends StatelessWidget {
  const OrderCompletedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: context.percentHeight(.25),
              ),
              Image.asset('assets/images/logo_rounded.png'),
              const SizedBox(
                height: 16,
              ),
              Text(
                'Pedido realizado com sucesso, em breve você receberá a confirmação do seu pedido.',
                style: context.textStyles.textExtraBold.copyWith(fontSize: 18),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 48,
              ),
              DeliveryButton(
                width: context.percentWidth(.9),
                label: 'Fechar',
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
