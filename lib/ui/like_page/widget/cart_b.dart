import 'package:flutter/material.dart';
import 'package:third_exam/services/local/sqflite/db.dart';

// ignore: must_be_immutable
class Buttonnchik extends StatefulWidget {
  Product data;
  Buttonnchik({super.key, required this.data});

  @override
  State<Buttonnchik> createState() => _ButtonnchikState();
}

class _ButtonnchikState extends State<Buttonnchik> {
  bool isAddingToCart = false; 

  @override
  Widget build(BuildContext context) {
    var data = widget.data;
    return ElevatedButton(
      onPressed: isAddingToCart
          ? null 
          : () async {
              setState(() {
                isAddingToCart = true;
              });

              
              Product? product = await DatabaseHelper.instance
                  .getProductById(data.productId.toString()  );

              if (product != null && product.count != null) {
                await DatabaseHelper.instance.updateProduct(
                  Product(
                    productId: product.productId,
                    count: product.count! + 1, 
                    name: product.name,
                    price: product.price,
                    imageUrl: product.imageUrl,

                    isCarted: product.isCarted,
                  ),
                ); 
               
              } else {
                await DatabaseHelper.instance.insertProduct(
                  Product(
                    productId: data.productId.toString(),
                    count: 1,
                    name: data.name,
                    price: data.price.toDouble(),
                    imageUrl: data.imageUrl,
                    isLiked: 0,
                    isCarted: 1,
                  ),
                );
              }

              setState(() {
                isAddingToCart = false;
              });
            },
      
      style: const ButtonStyle(
          backgroundColor: MaterialStatePropertyAll(Colors.black87)),
      child:  const Text(
        "Add to cart",
      ),
    );
  }
}
