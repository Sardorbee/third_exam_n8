import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:third_exam/services/local/sqflite/db.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  StreamController<void> databaseUpdateStreamController =
      StreamController<void>.broadcast();

  double total = 0;
  List<Product> productsInCart = [];

  @override
  void initState() {
    super.initState();
    databaseUpdateStreamController.stream.listen((_) {
      setState(() {});
    });
    _calculateTotal();
  }

  @override
  void dispose() {
    databaseUpdateStreamController.close();
    super.dispose();
  }

  Future<void> _calculateTotal() async {
    List<Product> cartProducts =
        await DatabaseHelper.instance.getProductsByIsCarted(1);
    databaseUpdateStreamController.add(null);
    double newTotal = 0;
    for (Product product in cartProducts) {
      newTotal += product.price * product.count!.toInt();
    }
    setState(() {
      total = newTotal;
      productsInCart = cartProducts;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Container(
        width: 370.h,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            boxShadow: const [
              BoxShadow(),
            ],
            border: Border.all(
              width: 1.h,
              color: Colors.black,
            ),
            color: Colors.white),
        child: FloatingActionButton(
          backgroundColor: Colors.black,
          shape: const OutlineInputBorder(),
          onPressed: null,
          child: Center(
            child: Text(
              "Total cost: $total ",
              style: TextStyle(fontSize: 21.sp),
            ),
          ),
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.black,
        actions: [
          TextButton(
            onPressed: () async {
              // Show the AlertDialog using the showDialog method
              await showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text('Confirmation'),
                    content: Text('Are you sure you want to delete?'),
                    actions: <Widget>[
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text('Cancel'),
                      ),
                      TextButton(
                        onPressed: () async {
                          await DatabaseHelper.instance.deleteIscarted(1);
                          databaseUpdateStreamController.add(null);
                          await _calculateTotal();

                          Navigator.of(context).pop();
                          setState(() {});
                        },
                        child: Text('Delete'),
                      ),
                    ],
                  );
                },
              );
            },
            child: Text(
              "Tozalash",
              style: TextStyle(color: Colors.white, fontSize: 20.sp),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(
              future: DatabaseHelper.instance.getProductsByIsCarted(1),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else if (!snapshot.hasData) {
                  return const Center(child: Text('No liked products found'));
                } else {
                  List<Product> d = snapshot.data;

                  return ListView.builder(
                    itemCount: d.length,
                    itemBuilder: (BuildContext context, int index) {
                      Product data = d[index];
                      return Container(
                        margin: EdgeInsets.all(8.h),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            boxShadow: const [
                              BoxShadow(),
                            ],
                            border: Border.all(
                              width: 1.h,
                              color: Colors.black,
                            ),
                            color: Colors.white),
                        child: ListTile(
                          title: Text(data.name),
                          subtitle: Text(
                              "Mahsulotlar soni: ${data.count.toString()} x ${data.price * data.count!.toInt()}"),
                          trailing: IconButton(
                            icon: const Icon(
                              Icons.delete,
                            ),
                            onPressed: () async {
                              await DatabaseHelper.instance
                                  .deleteProduct(data.productId);
                              await _calculateTotal();
                              showSnackbar();
                              setState(() {});
                            },
                          ),
                        ),
                      );
                    },
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}

void showSnackbar() {
  Fluttertoast.showToast(
    msg: 'Deleted Successfully!',
    toastLength: Toast.LENGTH_LONG,
    gravity: ToastGravity.SNACKBAR,
    timeInSecForIosWeb: 2,
    backgroundColor: Colors.red,
    textColor: Colors.white,
    fontSize: 16.0,
  );
}
