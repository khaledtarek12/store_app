class ProductModel {
  final int id;
  final String price;
  final String title;
  final String description;
  final String image;
  final String category;
  final RatingModel? rating;

  ProductModel(
      {required this.category,
      required this.id,
      required this.rating,
      required this.price,
      required this.title,
      required this.description,
      required this.image});

  factory ProductModel.fromJson(jsondata) {
    return ProductModel(
      category: jsondata['category'],
      id: jsondata['id'],
      price: jsondata['price'].toString(),
      title: jsondata['title'],
      description: jsondata['description'],
      image: jsondata['image'],
      rating: jsondata['rating'] == null
          ? null
          : RatingModel.formJson(jsondata['rating']),
    );
  }
}

class RatingModel {
  final String rate;
  final String conut;

  RatingModel({required this.rate, required this.conut});

  factory RatingModel.formJson(jsondata) {
    return RatingModel(
      rate: jsondata['rate'].toString(),
      conut: jsondata['count'].toString(),
    );
  }
}
