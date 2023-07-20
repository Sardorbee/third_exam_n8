import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:third_exam/services/model/products_by_id.dart';
import 'package:third_exam/services/model/universal.dart';
import 'package:third_exam/services/network/api.dart';
import 'package:third_exam/ui/cart_page/widget/cart_button.dart';
import 'package:third_exam/ui/id-products/widget/isliked.dart';

// ignore: must_be_immutable
class ProductsByID extends StatefulWidget {
  static const String routeName = '/ProductsByID';
  int? id;
  ProductsByID({super.key, required this.id});

  @override
  // ignore: library_private_types_in_public_api
  _ProductsByIDState createState() => _ProductsByIDState();
}

class _ProductsByIDState extends State<ProductsByID> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text('All Products'),
      ),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder<UniversalData>(
              future: ApiProvider.getbyID(id: widget.id),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else if (snapshot.hasData) {
                  if (snapshot.data!.error.isEmpty) {
                    UniversalData categorydata = snapshot.data!;

                    List<ProductModelById> prod = categorydata.data;

                    return GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2, childAspectRatio: 0.8),
                      itemCount: prod.length,
                      itemBuilder: (BuildContext context, int index) {
                        ProductModelById data = prod[index];
                        return Stack(
                          children: [
                            Container(
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
                              height: 222.h,
                              padding: EdgeInsets.all(8.h),
                              margin: EdgeInsets.all(8.h),
                              width: 300.h,
                              child: Column(
                                children: [
                                  Container(
                                      height: 100.h,
                                      child: CachedNetworkImage(
                                          imageUrl: data.imageUrl)),
                                  Text(data.name),
                                  Text(data.price.toString()),
                                  SizedBox(
                                    height: 10.h,
                                  ),
                                  CartButton(
                                    data: data,
                                    vv: () {
                                      showSnackbarForbutton();
                                    },
                                  )
                                ],
                              ),
                            ),
                            IslikedWidd(
                              i: data,
                              vvv: () {
                                showSnackbar();
                              },
                            )
                          ],
                        );
                      },
                    );
                  } else {
                    return Center(
                      child: Text(snapshot.data!.error),
                    );
                  }
                } else {
                  return const Center(child: Text('No results found'));
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
    msg: 'Added to Favourites!',
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 2,
    backgroundColor: Colors.black54,
    textColor: Colors.white,
    fontSize: 16.0,
  );
}

void showSnackbarForbutton() {
  Fluttertoast.showToast(
    msg: 'Ready to Ship!',
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 2,
    backgroundColor: Colors.black54,
    textColor: Colors.white,
    fontSize: 16.0,
  );
}
