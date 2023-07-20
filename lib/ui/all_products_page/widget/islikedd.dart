import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:third_exam/services/local/sqflite/db.dart';
import 'package:third_exam/services/model/product_model.dart';

// ignore: must_be_immutable
class AllLikedd extends StatefulWidget {
  InnerProductModel? i;
  VoidCallback v;
  AllLikedd({super.key, required this.i, required this.v});

  @override
  State<AllLikedd> createState() => _AllLikeddState();
}

class _AllLikeddState extends State<AllLikedd> {
  bool isLiked = false;
  void initIsLikedState() async {
    Product? product =
        await DatabaseHelper.instance.getProductById(widget.i!.id.toString());

    if (product != null) {
      setState(() {
        isLiked = product.isLiked == 1;
      });
    }
  }

  @override
  void initState() {
    initIsLikedState();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: 0,
      child: Container(
        alignment: Alignment.topRight,
        height: 50.h,
        width: 50.h,
        child: IconButton(
          icon: Icon(Icons.favorite),
          onPressed: () async {
            setState(() {
              isLiked = !isLiked;
            });

            if (isLiked == true) {
              await DatabaseHelper.instance.insertProduct(
                Product(
                  productId: widget.i!.id.toString(),
                  name: widget.i!.name,
                  price: widget.i!.price.toDouble(),
                  imageUrl: widget.i!.imageUrl,
                  isLiked: isLiked == true ? 1 : 0,
                ),
              );
              widget.v.call();
            } else {
              await DatabaseHelper.instance
                  .deleteProduct(widget.i!.id.toString());
            }
          },
          color: isLiked ? Colors.red : Colors.black,
        ),
      ),
    );
  }
}
