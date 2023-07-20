import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:third_exam/services/local/sqflite/db.dart';
import 'package:third_exam/ui/cart_page/widget/cart_button.dart';
import 'package:third_exam/ui/like_page/widget/cart_b.dart';

class LikePage extends StatefulWidget {
  const LikePage({super.key});

  @override
  State<LikePage> createState() => _LikePageState();
}

class _LikePageState extends State<LikePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(
              future: DatabaseHelper.instance.getProductsByIsLiked(1),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else if (!snapshot.hasData) {
                  return const Center(child: Text('No liked products found'));
                } else {
                  List<Product> data = snapshot.data;
                  return GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2, childAspectRatio: 0.85),
                    itemCount: snapshot.data.length,
                    itemBuilder: (BuildContext context, int index) {
                      Product dataa = data[index];

                      return Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            boxShadow: const[
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
                                child: Image.network(dataa.imageUrl)),
                            Text(dataa.name),
                            Text(dataa.price.toString()),
                            SizedBox(
                              height: 10.h,
                            ),
                            Buttonnchik(data: dataa),
                          ],
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
