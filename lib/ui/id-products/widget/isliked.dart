import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:third_exam/services/local/sqflite/db.dart';
import 'package:third_exam/services/model/products_by_id.dart';

class IslikedWidd extends StatefulWidget {
  ProductModelById? i;
  VoidCallback vvv;
  IslikedWidd({super.key, required this.i, required this.vvv});

  @override
  State<IslikedWidd> createState() => _IslikedWiddState();
}

class _IslikedWiddState extends State<IslikedWidd> {
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
          icon: const Icon(Icons.favorite),
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
              widget.vvv.call();
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
