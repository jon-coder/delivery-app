import 'package:bloc/bloc.dart';
import 'package:delivery_app/app/dto/order_product_dto.dart';
import 'package:delivery_app/app/pages/order/order_state.dart';

class OrderController extends Cubit<OrderState> {
  OrderController() : super(const OrderState.initial());

  void load(List<OrderProductDto> products) {
    emit(state.copyWith(orderProducts: products));
  }
}
