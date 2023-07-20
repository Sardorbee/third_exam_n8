import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:third_exam/services/model/category_model.dart';
import 'package:third_exam/services/model/universal.dart';
import 'package:third_exam/services/network/api.dart';
import 'package:third_exam/ui/app_routes.dart';

class HomePage extends StatefulWidget {
  static const String routeName = '/homePage';

  const HomePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text('Categoriyalar ro\'yxati'),
      ),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder<UniversalData>(
              future: ApiProvider.getBYCategory(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else if (snapshot.hasData) {
                  if (snapshot.data!.error.isEmpty) {
                    UniversalData categorydata = snapshot.data!;
                    List<CategoryModel> cat = categorydata.data;
                    return ListView.builder(
                      itemCount: cat.length,
                      itemBuilder: (BuildContext context, int index) {
                        CategoryModel data = cat[index];
                        return InkWell(
                            onTap: () {
                              Navigator.pushNamed(
                                  context, RouteNames.productsByID,
                                  arguments: data.id);
                            },
                            child: Container(
                              height: 100.h,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16),
                                  boxShadow: const [
                                    BoxShadow(),
                                  ],
                                  border: Border.all(
                                    width: 1,
                                    color: Colors.black,
                                  ),
                                  color: Colors.white),
                              margin: EdgeInsets.all(8.h),
                              padding: EdgeInsets.all(8.h),
                              child: Row(
                                children: [
                                  Expanded(
                                    flex: 4,
                                    child: CachedNetworkImage(
                                      imageUrl: data.imageUrl,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 20.h,
                                  ),
                                  Expanded(
                                    flex: 8,
                                    child: Text(
                                      data.name,
                                      style: TextStyle(fontSize: 20.sp),
                                    ),
                                  ),
                                ],
                              ),
                            ));
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
