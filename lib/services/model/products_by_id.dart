
class ProductModelById {
    int id;
    int categoryId;
    String name;
    int price;
    String imageUrl;
    String? description;

    ProductModelById({
        required this.id,
        required this.categoryId,
        required this.name,
        required this.price,
        required this.imageUrl,
        this.description,
    });

    factory ProductModelById.fromJson(Map<String, dynamic> json) => ProductModelById(
        id: json["id"],
        categoryId: json["category_id"],
        name: json["name"],
        price: json["price"],
        imageUrl: json["image_url"],
        description: json["description"]??'',
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "category_id": categoryId,
        "name": name,
        "price": price,
        "image_url": imageUrl,
        "description": description,
    };
}
