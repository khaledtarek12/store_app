import 'package:store_app/helper/api.dart';
import 'package:store_app/models/product_model.dart';

class CategoriesServices {
  Future<List<ProductModel>> getCategoriesProducts(
      {required String categoryName}) async {
    List<dynamic> data = await Api()
        // ignore: missing_required_param
        .get(url: 'https://fakestoreapi.com/products/category/$categoryName');

    List<ProductModel> productlist = [];
    for (var i = 0; i < data.length; i++) {
      productlist.add(ProductModel.fromJson(data[i]));
    }

    return productlist;
  }
}
