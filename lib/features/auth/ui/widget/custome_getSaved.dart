import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/constant/app_colors.dart';
import 'package:flutter_application_1/features/auth/repo/savedViwedArticle_fun.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:timeago/timeago.dart' as timeago;

class CustomeGetSavedarticle extends StatelessWidget {
  final String title;
  const CustomeGetSavedarticle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    final SavedviwedarticleFun _savedviwedarticleFun = SavedviwedarticleFun();
    return StreamBuilder(
      stream: _savedviwedarticleFun.getSavedArticle(),
      builder: ((context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator(color: AppColors.red));
        }

        if (snapshot.hasError) {
          return Center(child: Text("Error In Data"));
        }

        if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
          return Center(child: Text(title));
        }
        final articleDoc = snapshot.data!.docs;
        return ListView.builder(
          itemCount: articleDoc.length,
          shrinkWrap: true,
          physics: ClampingScrollPhysics(),
          itemBuilder: (context, index) {
            final articleData =
                articleDoc[index].data() as Map<String, dynamic>;
                final Timestamp timestamp =articleData['savedAt'] as Timestamp;

            return Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.red.shade200),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.network(articleData['image'] ?? ""),
                    Padding(
                      padding: EdgeInsets.only(
                        left: 12.w,
                        top: 12.h,
                        bottom: 12.h,
                      ),
                      child: Text(
                        articleData['catigory'] ?? "",
                        style: TextStyle(
                          color: AppColors.red,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 12.w),
                      child: Text(
                        articleData['title'] ?? "",
                        style: TextStyle(
                          color: AppColors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    SizedBox(height: 8.h),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 12.w),
                      child: Row(
                        children: [
                          Text(
                            articleData['publishedAt'] ?? "",
                            style: TextStyle(color: AppColors.gray),
                          ),
                          SizedBox(width: 2),
                          Text(
                            ".",
                            style: TextStyle(
                              color: AppColors.gray,
                              fontSize: 40,
                            ),
                          ),
                          SizedBox(width: 2),
                          Text(
                            timeago.format(timestamp.toDate())
                            ,style: TextStyle(color: AppColors.gray),
                          ),
                          Spacer(),
                          IconButton(
                            onPressed: () async {
                              await _savedviwedarticleFun.unSaved(
                                articleData['title'] ?? "",
                              );
                            },
                            icon: Icon(Icons.bookmark, color: AppColors.red),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10.h),
                    // Padding(
                    //   padding: const EdgeInsets.only(right: 12),
                    //   child:
                    // ),
                    SizedBox(height: 10.h),
                  ],
                ),
              ),
            );
          },
        );
      }),
    );
  }
}
