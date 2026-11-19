//import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/constant/app_colors.dart';
import 'package:flutter_application_1/core/rautes/routes_name.dart';
import 'package:flutter_application_1/core/states/app_states.dart';
import 'package:flutter_application_1/features/auth/ui/cubit/home_cubit.dart';
import 'package:flutter_application_1/features/auth/ui/cubit/home_state.dart';
import 'package:flutter_application_1/features/auth/ui/widget/custome_articles.dart';
import 'package:flutter_application_1/features/home/data/app_catigory.dart';
//import 'package:flutter_application_1/features/home/model/news_response/article.dart';
//import 'package:flutter_application_1/features/home/model/news_response/article.dart';
//import 'package:flutter_application_1/features/home/model/news_response/source.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
//import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
      int selectedCategory=0;
  late final HomeCubit _homeCubit;
  TabController? _tabController;

  @override
  void initState() {
    super.initState();
    _homeCubit = context.read<HomeCubit>();
    _tabController = TabController(
      length: AppCategorys.category.length,
      vsync: this,
    );
    _homeCubit.getNews(catigory: AppCategorys.category.first.cId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Colors.white10,
      //   title: Center(
      //     child: Text(
      //       "THE GAZETTE",
      //       style: TextStyle(color: AppColors.red, fontWeight: FontWeight.bold),
      //     ),
      //   ),
      //   actions: [IconButton(onPressed: (){
      //     Navigator.pushNamed(context, RoutesName.ProfileScreen);
      //   }, icon:Icon(Icons.account_circle_outlined,color: AppColors.gray,size: 30,))],
      //   bottom: PreferredSize(
      //     preferredSize: Size.fromHeight(8),
      //     child: Divider(color: Colors.red.shade200),
      //   ),
      // ),

      body: BlocConsumer<HomeCubit, HomeState>(
        listener: (context, state) {},
        bloc: _homeCubit,
        builder: (context, state) {
          if (state.getNewsState == AppStates.loading) {
            return const Center(
              child: CircularProgressIndicator(color: AppColors.gray),
            );
          }
          final news = state.newsResponse?.articles ?? [];
          return Column(
            children: [
              TabBar(
                controller: _tabController,
                isScrollable: true,
                indicatorColor: AppColors.red,
                dividerColor: AppColors.white,
                labelColor: AppColors.red,
                unselectedLabelColor: AppColors.gray,
                onTap: (index) {
                  setState(() {
                    selectedCategory=index;
                  });
                  final catigory = AppCategorys.category[index];
                  _homeCubit.getNews(catigory: catigory.cId);
                },
                tabs: AppCategorys.category.map((catigory) {
                  return Tab(text: catigory.cName);
                }).toList(),
              ),
              //
              Expanded(
                child:
                    // TabBarView(
                    //   controller: _tabController,
                    //   children: AppCategorys.category.map((catigory) {
                    ListView.builder(
                      itemCount: news.length,
                      itemBuilder: (context, index) {
                        final article = news[index];
                        return InkWell(
                          onTap: () {
                            Navigator.pushNamed(
                              context,
                              RoutesName.ArticleScrren,
                              arguments:{'article':article ,'category':AppCategorys.category[selectedCategory].cName}
                            );
                          },
                          child: CustomeArticles(image:article.urlToImage ?? "" ,title:article.title ?? "" ,author: article.author ?? "",),
                          // child: Container(
                          //   // decoration: BoxDecoration(
                          //   // ),
                          //   child: Column(
                          //     mainAxisAlignment: MainAxisAlignment.start,
                          //     crossAxisAlignment: CrossAxisAlignment.start,
                          //     children: [
                          //       Image.network(article.urlToImage ?? ""),
                          //       Text(
                          //         article.author ?? "",
                          //         style: TextStyle(
                          //           color: AppColors.black,
                          //           fontWeight: FontWeight.bold,
                          //           fontSize: 20,
                          //         ),
                          //       ),
                          //       Text(
                          //         article.title ?? "",
                          //         style: TextStyle(color: AppColors.black),
                          //       ),
                          //     ],
                          //   ),
                          // ),
                        );
                      },
                    ),
                //   }).toList(),
                // ),
              ),
            ],
          );
        },
      ),
      
    );
  }
}
