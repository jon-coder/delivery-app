import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import 'package:delivery_app/app/core/ui/helpers/size_extensions.dart';
import 'package:delivery_app/app/core/ui/styles/text_styles.dart';
import 'package:delivery_app/app/core/ui/widgets/delivery_appbar.dart';

class ProductDetailPage extends StatelessWidget {
  const ProductDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DeliveryAppbar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: context.screenWidth,
            height: context.percentHeight(.4),
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                  'https://storage.googleapis.com/domain-images/daa9c855-3149-4d13-8da1-fcf5712742e4/products/gallery_106a48c5-c8b2-4657-b6dc-e623d536ae06.jpg',
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 12.0,
            ),
            child: Text(
              'X- Calabresa',
              style: context.textStyles.textExtraBold.copyWith(
                fontSize: 22,
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 12.0,
              ),
              child: SingleChildScrollView(
                child: Text(
                  'Lanche acompanha pão, hambúguer, mussarela, alface, tomate e maioneseLanche acompanha pão, hambúguer, mussarela, alface, tomate e maioneseLanche acompanha pão, hambúguer, mussarela, alface, tomate e maioneseLanche acompanha pão, hambúguer, mussarela, alface, tomate e maioneseLanche acompanha pão, hambúguer, mussarela, alface, tomate e maioneseLanche acompanha pão, hambúguer, mussarela, alface, tomate e maioneseLanche acompanha pão, hambúguer, mussarela, alface, tomate e maioneseLanche acompanha pão, hambúguer, mussarela, alface, tomate e maioneseLanche acompanha pão, hambúguer, mussarela, alface, tomate e maioneseLanche acompanha pão, hambúguer, mussarela, alface, tomate e maioneseLanche acompanha pão, hambúguer, mussarela, alface, tomate e maioneseLanche acompanha pão, hambúguer, mussarela, alface, tomate e maioneseLanche acompanha pão, hambúguer, mussarela, alface, tomate e maioneseLanche acompanha pão, hambúguer, mussarela, alface, tomate e maioneseLanche acompanha pão, hambúguer, mussarela, alface, tomate e maioneseLanche acompanha pão, hambúguer, mussarela, alface, tomate e maioneseLanche acompanha pão, hambúguer, mussarela, alface, tomate e maioneseLanche acompanha pão, hambúguer, mussarela, alface, tomate e maioneseLanche acompanha pão, hambúguer, mussarela, alface, tomate e maioneseLanche acompanha pão, hambúguer, mussarela, alface, tomate e maioneseLanche acompanha pão, hambúguer, mussarela, alface, tomate e maioneseLanche acompanha pão, hambúguer, mussarela, alface, tomate e maioneseLanche acompanha pão, hambúguer, mussarela, alface, tomate e maioneseLanche acompanha pão, hambúguer, mussarela, alface, tomate e maioneseLanche acompanha pão, hambúguer, mussarela, alface, tomate e maioneseLanche acompanha pão, hambúguer, mussarela, alface, tomate e maioneseLanche acompanha pão, hambúguer, mussarela, alface, tomate e maioneseLanche acompanha pão, hambúguer, mussarela, alface, tomate e maioneseLanche acompanha pão, hambúguer, mussarela, alface, tomate e maioneseLanche acompanha pão, hambúguer, mussarela, alface, tomate e maioneseLanche acompanha pão, hambúguer, mussarela, alface, tomate e maioneseLanche acompanha pão, hambúguer, mussarela, alface, tomate e maioneseLanche acompanha pão, hambúguer, mussarela, alface, tomate e maioneseLanche acompanha pão, hambúguer, mussarela, alface, tomate e maioneseLanche acompanha pão, hambúguer, mussarela, alface, tomate e maionese',
                  style: context.textStyles.textRegular.copyWith(
                    fontSize: 12,
                  ),
                ),
              ),
            ),
          ),
          const Divider(),
          Row(
            children: [
              SizedBox(
                width: context.percentWidth(.5),
                child: const Text('Increment Button'),
              ),
              Container(
                width: context.percentWidth(.5),
                height: 68,
                padding: const EdgeInsets.all(8),
                child: ElevatedButton(
                  onPressed: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Adicionar',
                        style: context.textStyles.textExtraBold.copyWith(
                          fontSize: 12,
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        child: AutoSizeText(
                          'RS 11,00',
                          style: context.textStyles.textExtraBold,
                          maxFontSize: 13,
                          minFontSize: 6,
                          maxLines: 1,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
