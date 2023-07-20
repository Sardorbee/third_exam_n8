import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:third_exam/services/model/product_model.dart';
import 'package:third_exam/services/model/universal.dart';
import 'package:third_exam/services/network/api.dart';
import 'package:third_exam/ui/all_products_page/widget/islikedd.dart';
import 'package:third_exam/ui/app_routes.dart';
import 'package:third_exam/ui/cart_page/widget/cart_button.dart';

class AllProducts extends StatefulWidget {
  static const String routeName = '/AllProducts';

  const AllProducts({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _AllProductsState createState() => _AllProductsState();
}

class _AllProductsState extends State<AllProducts> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text('All Products'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, RouteNames.likePage);
            },
            icon: const Icon(
              Icons.favorite,
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder<UniversalData>(
              future: ApiProvider.getAllProducts(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else if (snapshot.hasData) {
                  if (snapshot.data!.error.isEmpty) {
                    UniversalData categorydata = snapshot.data!;

                    ProductModel prod = categorydata.data;
                    List<InnerProductModel> pro = prod.data;

                    return GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2, childAspectRatio: 0.8),
                      itemCount: pro.length,
                      itemBuilder: (BuildContext context, int index) {
                        InnerProductModel data = pro[index];
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
                              height: 250.h,
                              padding: EdgeInsets.all(8.h),
                              margin: EdgeInsets.all(8.h),
                              width: 290.h,
                              child: Column(
                                children: [
                                  Container(
                                      height: 100.h,
                                      child: Image.network(data.imageUrl)),
                                  Text(data.name),
                                  Text(data.price.toString()),
                                  SizedBox(
                                    height: 10.h,
                                  ),
                                  CartButton(
                                    data: data,
                                    vv: () {
                                      showSnackbarForCarttt();
                                    },
                                  ),
                                ],
                              ),
                            ),
                            AllLikedd(
                              i: data,
                              v: () {
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

void showSnackbarForCarttt() {
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
