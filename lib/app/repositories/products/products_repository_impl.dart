import 'dart:developer';
import 'package:dio/dio.dart';

import '../../core/exceptions/repository_exception.dart';
import '../../core/rest_client/custom_dio.dart';
import '../../models/product_model.dart';

import './products_repository.dart';

class ProductsRepositoryImpl implements ProductsRepository {
  final CustomDio dio;

  ProductsRepositoryImpl({
    required this.dio,
  });

  @override
  Future<List<ProductModel>> findAll() async {
    try {
      final result = await dio.unauth().get('/products');
      return result.data.map<ProductModel>((p) => ProductModel.fromMap(p)).toList();
    } on DioError catch (e, s) {
      log(
        'Erro ao buscar produtos',
        error: e.message,
        stackTrace: s,
      );
      throw RepositoryException(
        message: 'Erro ao buscar produtos',
      );
    }
  }
}
