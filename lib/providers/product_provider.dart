import "package:riverpod_annotation/riverpod_annotation.dart";
import "package:tech_byte/models/product_model.dart";
import "package:tech_byte/utils/api.dart" as api;

part "product_provider.g.dart";

@riverpod
class Product extends _$Product {
  Future<TBProductModel> fetchProduct(int id) async {
    TBProductModel product = await api.getProduct(id);

    return product;
  }

  @override
  FutureOr<TBProductModel> build(int id) async {
    return fetchProduct(id);
  }

  Future<void> edit(TBProductModel product) async {
    state = const AsyncValue.loading();

    state = await AsyncValue.guard(() async {
      await api.editProduct(product.id, product);
      return fetchProduct(id);
    });
  }
}
