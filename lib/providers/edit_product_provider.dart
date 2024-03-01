import "package:riverpod_annotation/riverpod_annotation.dart";
import "package:tech_byte/models/product_model.dart";
import "package:tech_byte/providers/product_list_provider.dart";
import "package:tech_byte/providers/product_provider.dart";

part "edit_product_provider.g.dart";

enum EditProductStateType { idle, loading, success, error }

@riverpod
class EditProduct extends _$EditProduct {
  @override
  EditProductStateType build(int id) {
    return EditProductStateType.idle;
  }

  void edit(TBProductModel editedProduct) async {
    state = EditProductStateType.loading;
    try {
      await Future.delayed(const Duration(seconds: 3));
      ref.read(productProvider(editedProduct.id).notifier).fetchProduct(id);

      ref.read(productListProvider.notifier).updateProduct(editedProduct);
      state = EditProductStateType.success;
    } catch (error) {
      state = EditProductStateType.error;
    }
  }
}
