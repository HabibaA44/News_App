import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/constant/app_colors.dart';
import 'package:flutter_application_1/core/constant/app_images.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomeArticles extends StatelessWidget {
  final String image;
  final String title;
  final String author;
  final String ?time;
  const CustomeArticles({
    super.key,
    required this.author,
    required this.image,
    required this.title,
     this.time,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 15.h),
      child: Container(
        // decoration: BoxDecoration(
        // ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(image ?? "assets/profile.jpeg"),
            Row(
              children: [
                Expanded(
                  child: Text(
                    author,
                    style: TextStyle(
                      color: AppColors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
                Spacer(),
                Text(time??"", style: TextStyle(color: Colors.red.shade200)),
              ],
            ),
            Text(title, style: TextStyle(color: AppColors.black)),
          ],
        ),
      ),
    );
  }
}
