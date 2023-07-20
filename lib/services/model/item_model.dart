class Item {
  
  String name;
  String description;
  String imagePath;
  double price;
  int itemsCount;
  bool isLiked;
  bool onSaved;

  Item({
    
   required this.name,
  required  this.description,
   required this.imagePath,
  required  this.price,
  required  this.itemsCount,
   required this.isLiked,
   required this.onSaved,
  });

  // Convert the model to a Map (for inserting into the database)
  Map<String, dynamic> toMap() {
    return {
    
      'name': name,
      'description': description,
      'imagePath': imagePath,
      'price': price,
      'itemsCount': itemsCount,
      'isLiked':
          isLiked ? 1 : 0, // Convert bool to integer (1 for true, 0 for false)
      'onSaved':
          onSaved ? 1 : 0, // Convert bool to integer (1 for true, 0 for false)
    };
  }

  // Create a model from a Map (for reading from the database)
  factory Item.fromMap(Map<String, dynamic> map) {
    return Item(
     
      name: map['name'],
      description: map['description'],
      imagePath: map['imagePath'],
      price: map['price'],
      itemsCount: map['itemsCount'],
      isLiked: map['isLiked'] == 1, // Convert integer to bool
      onSaved: map['onSaved'] == 1, // Convert integer to bool
    );
  }
}
