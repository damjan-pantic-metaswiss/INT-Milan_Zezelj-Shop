import "package:riverpod_annotation/riverpod_annotation.dart";
import "package:tech_byte/models/product_model.dart";
import "package:tech_byte/providers/product_list_provider.dart";
import "package:tech_byte/utils/api.dart" as api;

part "edit_product_provider.g.dart";

enum EditProductStateType { idle, loading, success, error }

@riverpod
class EditProduct extends _$EditProduct {
  @override
  EditProductStateType build(int id) {
    return EditProductStateType.idle;
  }

  void edit(TBProductModel newProduct) async {
    state = EditProductStateType.loading;
    try {
      await api.editProduct(newProduct.id, newProduct);

      ref.read(productListProvider.notifier).fetchProducts();
      state = EditProductStateType.success;
    } catch (error) {
      state = EditProductStateType.error;
    }
  }
}
