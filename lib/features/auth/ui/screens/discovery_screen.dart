import 'package:flutter/material.dart';
//import 'package:flutter_application_1/core/constant/app_colors.dart';
//import 'package:flutter_application_1/features/auth/repo/savedViwedArticle_fun.dart';
import 'package:flutter_application_1/features/auth/ui/widget/custome%20_getviwedArticle.dart';
//import 'package:flutter_application_1/features/home/model/news_response/article.dart';

class DiscoveryScreen extends StatefulWidget {
  const DiscoveryScreen({super.key});

  @override
  State<DiscoveryScreen> createState() => _DiscoveryScreenState();
}

class _DiscoveryScreenState extends State<DiscoveryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: CustomeGetViwedarticle(title: "History is Empty"));
  }
}
