// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/constant/app_colors.dart';
import 'package:flutter_application_1/features/auth/repo/savedViwedArticle_fun.dart';
import 'package:flutter_application_1/features/auth/ui/widget/custome_article_container.dart';
//import 'package:flutter_application_1/features/home/data/app_catigory.dart';
//import 'package:flutter_application_1/features/auth/ui/widget/custome_article_container.dart';
import 'package:flutter_application_1/features/home/model/news_response/article.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
//import 'package:timeago/timeago.dart' as timrago;
import 'package:timeago/timeago.dart' as timeago;

class ArticleScreen extends StatefulWidget {
  final Article article;
  final String catigory;
  const ArticleScreen({
    super.key,
    required this.article,
    required this.catigory,
  });

  @override
  State<ArticleScreen> createState() => _ArticleScreenState();
}

class _ArticleScreenState extends State<ArticleScreen> {
  late DateTime openedTime;
  bool isSaved = false;

  
final SavedviwedarticleFun _savedviwedarticleFun =SavedviwedarticleFun();
  @override
  void initState() {
    super.initState();
    openedTime = DateTime.now();
    _savedviwedarticleFun.viewArticle(widget.article, widget.catigory);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white10,
        iconTheme: IconThemeData(color: AppColors.red),
        title: Text(
          "THE GAZETTE",
          style: TextStyle(color: AppColors.red, fontWeight: FontWeight.bold),
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(8),
          child: Divider(color: Colors.red.shade200),
        ),
      ),

      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
        child: SingleChildScrollView(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 8.h),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6.r),
                  color: AppColors.red,
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                  child: Text(
                    widget.catigory,
                    style: TextStyle(color: AppColors.white),
                  ),
                ),
              ),
              SizedBox(height: 8.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 18.w),
                child: Text(
                  widget.article.title ?? "",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: AppColors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),
                ),
              ),
              SizedBox(height: 12.h),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      widget.article.author ?? "unKwon",
                      style: TextStyle(
                        color: AppColors.red,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Spacer(),
                  Expanded(
                    child: Text(
                      DateFormat(
                        'MMM d, yyyy',
                      ).format(DateTime.parse(widget.article.publishedAt!)),
                      style: TextStyle(color: AppColors.black),
                    ),
                  ),
                  Spacer(),
                  Expanded(child: Text(timeago.format(openedTime))),
                ],
              ),
              SizedBox(height: 12.h),
              Image.network(widget.article.urlToImage ?? ""),
              SizedBox(height: 12.h),

              Row(
                children: [
                  Expanded(
                    child: Text(
                      widget.article.description ?? "",
                      style: TextStyle(color: AppColors.gray, fontSize: 16),
                    ),
                  ),
                  SizedBox(width: 5.w),
                  Column(
                    children: [
                      CustomeArticleContainer(icon: Icons.translate_outlined),
                      SizedBox(height: 5.h),
                      CustomeArticleContainer(icon: Icons.share),
                      SizedBox(height: 5.h),
                      CustomeArticleContainer(
                        icon: Icons.bookmark,
                        onTap:()async{
                        await  _savedviwedarticleFun.savedArticle(widget.article ,widget.catigory);
                        setState(() {
                          isSaved=true;
                        });
                        },
                        iconColor: isSaved ? AppColors.white : AppColors.black,
                        backgroundColor: isSaved
                            ? AppColors.red
                            : AppColors.white,
                      ),

                      //conButton(onPressed: onPressed, icon: icon)
                    ],
                  ),
                ],
              ),
              Text(
                widget.article.content ?? "",
                style: TextStyle(color: AppColors.black, fontSize: 16),
              ),

              
            ],
          ),
        ),
      ),
    );
  }
}
