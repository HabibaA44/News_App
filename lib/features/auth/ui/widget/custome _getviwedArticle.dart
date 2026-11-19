import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/constant/app_colors.dart';
//import 'package:flutter_application_1/core/rautes/routes_name.dart';
import 'package:flutter_application_1/features/auth/repo/savedViwedArticle_fun.dart';
import 'package:flutter_application_1/features/auth/ui/widget/custome_articles.dart';
import 'package:timeago/timeago.dart' as timeago;

class CustomeGetViwedarticle extends StatelessWidget {
  final String title;
  const CustomeGetViwedarticle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    final SavedviwedarticleFun _savedViwedArticleFun = SavedviwedarticleFun();
    return StreamBuilder(
      stream: _savedViwedArticleFun.getViwedArticle(),
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
            final Timestamp timestamp = articleData['veiwAt'] as Timestamp;
            final time = timeago.format(timestamp.toDate());
            return CustomeArticles(
              image: articleData['image'] ?? "",
              title: articleData['title'] ?? "",
              author: articleData['author'] ?? "",
              time: time,
            );
          },
        );
      }),
    );
  }
}
