//import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/constant/app_colors.dart';
import 'package:flutter_application_1/core/constant/app_images.dart';
import 'package:flutter_application_1/features/auth/ui/widget/custome%20_getviwedArticle.dart';
import 'package:flutter_application_1/features/auth/ui/widget/custome_getSaved.dart';
//import 'package:flutter_application_1/features/auth/ui/cubit/auth_cubit.dart';
//import 'package:flutter_application_1/core/provider/data_provider.dart';
// import 'package:flutter_application_1/features/auth/ui/cubit/auth_state.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
//import 'package:provider/provider.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    String? name = FirebaseAuth.instance.currentUser?.displayName ?? "";
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverToBoxAdapter(
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.topRight,
                    child: IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.settings_outlined),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.red.shade200),
                      borderRadius: BorderRadius.circular(80),
                      color: AppColors.white,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(80),
                        child: Image.asset(
                          AppImages.profileImage,
                          width: 150,
                          height: 150,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    "PREMIUM MEMBER",
                    style: TextStyle(
                      color: AppColors.red,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    name,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 5),
                  Text(
                    "Reader Since Octobar 2021  .London ,UK",
                    style: TextStyle(color: AppColors.gray),
                  ),
                ],
              ),
            ),
            SliverAppBar(
              automaticallyImplyLeading: false,
              pinned: true,
              backgroundColor: Colors.white,
              title: TabBar(
                controller: _tabController,
                isScrollable: false,
                indicatorColor: AppColors.red,
                dividerColor: AppColors.white,
                labelColor: AppColors.red,
                unselectedLabelColor: AppColors.gray,
                tabs: [
                  Tab(text: "SAVED"),
                  Tab(text: "HISTORY"),
                  Tab(text: "FOLLOWING"),
                  Tab(text: "NEWSELLEP"),
                ],
              ),
            ),
          ];
        },

        // SizedBox(height: 5),
        body: TabBarView(
          controller: _tabController,
          children: [
            CustomeGetSavedarticle(title: "No Saved Articles"),
            CustomeGetViwedarticle(title: "History is Empty"),
            Center(child: Text("No Data")),
            Center(child: Text("No Data")),
          ],
        ),
      ),
    );
  }
}
