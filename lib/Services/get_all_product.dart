import 'package:store_app/helper/api.dart';
import 'package:store_app/models/product_model.dart';

class GetAllProductServices {
  Future<List<ProductModel>> getAllProducts() async {
    List<dynamic> data =
        // ignore: missing_required_param
        await Api().get(url: 'https://fakestoreapi.com/products');

    List<ProductModel> productlist = [];
    for (var i = 0; i < data.length; i++) {
      productlist.add(ProductModel.fromJson(data[i]));
    }

    return productlist;
  }
}
