import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._();
  static Database? _database;

  DatabaseHelper._();

  factory DatabaseHelper() {
    return instance;
  }

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String databasesPath = await getDatabasesPath();
    String dbPath = join(databasesPath, 'products.db');

    return await openDatabase(dbPath, version: 1, onCreate: _onCreate);
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE products(
        productId TEXT PRIMARY KEY,
        count INTEGER,
        name TEXT,
        price REAL,
        imageUrl TEXT,
        isLiked INTEGER,
        isCarted INTEGER
      )
    ''');
  }

  
  Future<void> insertProduct(Product product) async {
    final db = await database;
    await db.insert('products', product.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
    
  }

  
  Future<Product?> getProductById(String productId) async {
  final db = await database;
  final List<Map<String, dynamic>> maps = await db.query(
    'products',
    where: 'productId = ?',
    whereArgs: [productId],
  );

  if (maps.isNotEmpty) {
    return Product.fromMap(maps.first);
  } else {
    return null;
  }
}
Future<List<Product>> getProductsByIsLiked(int isLiked) async {
  final db = await database;
  final List<Map<String, dynamic>> maps = await db.query(
    'products',
    where: 'isLiked = ?',
    whereArgs: [isLiked],
  );

  return List.generate(maps.length, (i) {
    return Product.fromMap(maps[i]);
  });
}
Future<List<Product>> getProductsByIsCarted(int isCarted) async {
  final db = await database;
  final List<Map<String, dynamic>> maps = await db.query(
    'products',
    where: 'isCarted = ?',
    whereArgs: [isCarted],
  );

  return List.generate(maps.length, (i) {
    return Product.fromMap(maps[i]);
  });
}

Future<List<Product>> getAllProducts() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('products');
    return List.generate(maps.length, (i) {
      return Product.fromMap(maps[i]);
    });
  }

  
  Future<void> updateProduct(Product product) async {
    final db = await database;
    await db.update(
      'products',
      product.toMap(),
      where: 'productId = ?',
      whereArgs: [product.productId],
    );
  }

 
  Future<void> deleteProduct(String productId) async {
    final db = await database;
    await db.delete(
      'products',
      where: 'productId = ?',
      whereArgs: [productId],
    );
  }
  Future<void> deleteIscarted(int isCarted) async {
    final db = await database;
    await db.delete(
      'products',
      where: 'isCarted = ?',
      whereArgs: [isCarted],
    );
  }
}

class Product {
  String productId;
  int? count;
  String name;
  double price;
  String imageUrl;
  int? isLiked;
  int ?isCarted;

  Product({
    required this.productId,
     this.count,
    required this.name,
    required this.price,
    required this.imageUrl,
     this.isLiked,
     this.isCarted,
  });

 
  Map<String, dynamic> toMap() {
    return {
      'productId': productId,
      'count': count,
      'name': name,
      'price': price,
      'imageUrl': imageUrl,
      'isLiked': isLiked,
      'isCarted': isCarted,
    };
  }

  
  static Product fromMap(Map<String, dynamic> map) {
    return Product(
      productId: map['productId'],
      count: map['count'],
      name: map['name'],
      price: map['price'],
      imageUrl: map['imageUrl'],
      isLiked: map['isLiked'],
      isCarted: map['isCarted'],
    );
  }
}
