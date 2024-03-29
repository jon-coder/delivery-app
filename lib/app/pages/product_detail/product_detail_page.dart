import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/extensions/formatter_extensions.dart';
import '../../core/ui/base_state/base_state.dart';
import '../../core/ui/helpers/size_extensions.dart';
import '../../core/ui/styles/text_styles.dart';
import '../../core/ui/widgets/delivery_appbar.dart';
import '../../core/ui/widgets/delivery_increment_decrement_button.dart';
import '../../dto/order_product_dto.dart';
import '../../models/product_model.dart';

import 'product_detail_controller.dart';

class ProductDetailPage extends StatefulWidget {
  final ProductModel product;
  final OrderProductDto? order;

  const ProductDetailPage({
    super.key,
    required this.product,
    this.order,
  });

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends BaseState<ProductDetailPage, ProductDetailController> {
  @override
  void initState() {
    super.initState();
    final amount = widget.order?.amount ?? 1;
    controller.initial(amount, widget.order != null);
  }

  void _showConfirmDelete(int amount) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Deseja Excluir o Produto?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                'Cancelar',
                style: context.textStyles.textBold.copyWith(
                  color: Colors.red,
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.of(context).pop(
                  OrderProductDto(
                    product: widget.product,
                    amount: amount,
                  ),
                );
              },
              child: Text(
                'Confirmar',
                style: context.textStyles.textBold.copyWith(),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DeliveryAppbar(),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: context.screenWidth,
              height: context.percentHeight(.4),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                    widget.product.image,
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
                widget.product.name,
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
                    widget.product.description,
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
                Container(
                  width: context.percentWidth(.5),
                  height: 68,
                  padding: const EdgeInsets.all(8),
                  child: BlocBuilder<ProductDetailController, int>(
                    builder: (context, amount) {
                      return DeliveryIncrementDecrementButton(
                        amount: amount,
                        incrementOnTap: () {
                          controller.increment();
                        },
                        decrementOnTap: () {
                          controller.decrement();
                        },
                      );
                    },
                  ),
                ),
                Container(
                  width: context.percentWidth(.5),
                  height: 68,
                  padding: const EdgeInsets.all(8),
                  child: BlocBuilder<ProductDetailController, int>(
                    builder: (context, amount) {
                      return ElevatedButton(
                        style: amount == 0
                            ? ElevatedButton.styleFrom(
                                backgroundColor: Colors.red,
                              )
                            : null,
                        onPressed: () {
                          if (amount == 0) {
                            _showConfirmDelete(amount);
                          } else {
                            Navigator.of(context).pop(
                              OrderProductDto(
                                product: widget.product,
                                amount: amount,
                              ),
                            );
                          }
                        },
                        child: Visibility(
                          visible: amount > 0,
                          replacement: Text(
                            'Excluir Produto',
                            style: context.textStyles.textExtraBold,
                          ),
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
                                  (widget.product.price * amount).currencyPtBR,
                                  style: context.textStyles.textExtraBold,
                                  maxFontSize: 13,
                                  minFontSize: 6,
                                  maxLines: 1,
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
