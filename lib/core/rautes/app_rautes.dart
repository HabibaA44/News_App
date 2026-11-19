import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/rautes/routes_name.dart';
import 'package:flutter_application_1/features/auth/ui/cubit/auth_cubit.dart';
import 'package:flutter_application_1/features/auth/ui/cubit/home_cubit.dart';
import 'package:flutter_application_1/features/auth/ui/screens/article_screen.dart';
import 'package:flutter_application_1/features/auth/ui/screens/discovery_screen.dart';
import 'package:flutter_application_1/features/auth/ui/screens/home_screen.dart';
import 'package:flutter_application_1/features/auth/ui/screens/layout_screen.dart';
import 'package:flutter_application_1/features/auth/ui/screens/login_screen.dart';
import 'package:flutter_application_1/features/auth/ui/screens/profile_screen.dart';
import 'package:flutter_application_1/features/auth/ui/screens/register_screen.dart';
//import 'package:flutter_application_1/features/home/model/news_response/article.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRautes {
  AppRautes._();

  static Route<dynamic>? onGenerateRoute(RouteSettings setting) {
    switch (setting.name) {
      case RoutesName.LoginScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => AuthCubit(),
            child: LoginScreen(),
          ),
        );

      case RoutesName.RegisterScreen:
        return MaterialPageRoute(
          builder: (_) => 
          BlocProvider(
            create: (context) => AuthCubit(),
            child: RegisterScreen(),
          ),
        );

      case RoutesName.HomeScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => HomeCubit(),
            child: HomeScreen(),
          ),
        );

      case RoutesName.ArticleScrren:
      final arg=setting.arguments as Map<String,dynamic>;
      final selectedArticle=arg['article'] ;
      final selectedCategory=arg['category'];


        return MaterialPageRoute(builder: (_) => ArticleScreen(
          article: selectedArticle,
          catigory:selectedCategory
        ),
        );

      case RoutesName.ProfileScreen:
        return MaterialPageRoute(builder: (_) =>BlocProvider(create: (context)=>AuthCubit(),child: ProfileScreen()));

case RoutesName.DiscoveryScreen:
return MaterialPageRoute(builder: (_)=>DiscoveryScreen());

case RoutesName.LayoutScreen:
return MaterialPageRoute(builder: (_)=>BlocProvider(create: (context)=>HomeCubit(),child: LayoutScreen()));

      default:
        return null;
    }
  }
}
