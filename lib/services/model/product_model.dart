class ProductModel {
  List<InnerProductModel> data;

  ProductModel({
    required this.data,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        data: List<InnerProductModel>.from(
            json["data"].map((x) => InnerProductModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class InnerProductModel {
  int id;
  int categoryId;
  String name;
  int price;
  String imageUrl;

  InnerProductModel({
    required this.id,
    required this.categoryId,
    required this.name,
    required this.price,
    required this.imageUrl,
  });

  factory InnerProductModel.fromJson(Map<String, dynamic> json) =>
      InnerProductModel(
        id: json["id"],
        categoryId: json["category_id"],
        name: json["name"],
        price: json["price"],
        imageUrl: json["image_url"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "category_id": categoryId,
        "name": name,
        "price": price,
        "image_url": imageUrl,
      };
}
