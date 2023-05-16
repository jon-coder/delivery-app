import 'package:delivery_app/app/core/ui/base_state/base_state.dart';
import 'package:delivery_app/app/core/ui/widgets/delivery_button.dart';
import 'package:delivery_app/app/models/payment_type_model.dart';
import 'package:delivery_app/app/pages/order/order_controller.dart';
import 'package:delivery_app/app/pages/order/order_state.dart';
import 'package:delivery_app/app/pages/order/widgets/order_field.dart';
import 'package:delivery_app/app/pages/order/widgets/payment_types_field.dart';
import 'package:flutter/material.dart';
import 'package:delivery_app/app/dto/order_product_dto.dart';
import 'package:delivery_app/app/pages/order/widgets/order_product_tile.dart';
import 'package:delivery_app/app/core/ui/widgets/delivery_appbar.dart';
import 'package:delivery_app/app/core/ui/styles/text_styles.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:validatorless/validatorless.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({Key? key}) : super(key: key);

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends BaseState<OrderPage, OrderController> {
  @override
  void onReady() {
    final products = ModalRoute.of(context)!.settings.arguments as List<OrderProductDto>;
    controller.load(products);
    super.onReady();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<OrderController, OrderState>(
      listener: (context, state) {
        state.status.matchAny(
          any: () => hideLoader(),
          loading: () => showLoader(),
          error: () {
            hideLoader();
            showError(state.errorMessage ?? 'Erro não informado');
          },
        );
      },
      child: Scaffold(
        appBar: DeliveryAppbar(),
        body: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 10,
                ),
                child: Row(
                  children: [
                    Text(
                      'Carrinho',
                      style: context.textStyles.textTitle,
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Image.asset('assets/images/trashRegular.png'),
                    )
                  ],
                ),
              ),
            ),
            BlocSelector<OrderController, OrderState, List<OrderProductDto>>(
              selector: (state) => state.orderProducts,
              builder: (context, orderProducts) {
                return SliverList(
                  delegate: SliverChildBuilderDelegate(
                    childCount: orderProducts.length,
                    (context, index) {
                      final orderProduct = orderProducts[index];
                      return Column(
                        children: [
                          OrderProductTile(
                            index: index,
                            orderProduct: orderProduct,
                          ),
                        ],
                      );
                    },
                  ),
                );
              },
            ),
            SliverToBoxAdapter(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Total do pedido',
                          style: context.textStyles.textExtraBold.copyWith(
                            fontSize: 16,
                          ),
                        ),
                        Text(
                          r'R$ 200,00',
                          style: context.textStyles.textExtraBold.copyWith(
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Divider(
                    color: Colors.grey,
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  OrderField(
                    title: 'Endereco de entrga',
                    controller: TextEditingController(),
                    validator: Validatorless.required('m'),
                    hintText: 'Digite um endereco',
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  OrderField(
                    title: 'CPF',
                    controller: TextEditingController(),
                    validator: Validatorless.required('m'),
                    hintText: 'Digite o CPF',
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  BlocSelector<OrderController, OrderState, List<PaymentTypeModel>>(
                    selector: (state) => state.paymentTypes,
                    builder: (context, paymentTypes) {
                      return PaymentTypesField(
                        paymentTypes: paymentTypes,
                      );
                    },
                  )
                ],
              ),
            ),
            SliverFillRemaining(
              hasScrollBody: false,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const Divider(
                    color: Colors.grey,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 16,
                      right: 16,
                      top: 12,
                      bottom: 32,
                    ),
                    child: DeliveryButton(
                      width: double.infinity,
                      height: 42,
                      label: 'FINALIZAR',
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
