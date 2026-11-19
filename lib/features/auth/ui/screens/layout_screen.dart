import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/constant/app_colors.dart';
import 'package:flutter_application_1/core/provider/data_provider.dart';
//import 'package:flutter_application_1/core/rautes/routes_name.dart';
import 'package:flutter_application_1/features/auth/ui/screens/discovery_screen.dart';
import 'package:flutter_application_1/features/auth/ui/screens/home_screen.dart';
import 'package:flutter_application_1/features/auth/ui/screens/profile_screen.dart';
import 'package:flutter_application_1/features/auth/ui/screens/saved_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LayoutScreen extends StatefulWidget {
  const LayoutScreen({super.key});

  @override
  State<LayoutScreen> createState() => _LayoutScreenState();
}

class _LayoutScreenState extends State<LayoutScreen> {
  List<Widget> Pages = [HomeScreen(), DiscoveryScreen(),SavedScreen() , ProfileScreen()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white38,
        title: Center(
          child: Text(
            "THE GAZETTE",
            style: TextStyle(color: AppColors.red, fontWeight: FontWeight.bold),
          ),
        ),
        // actions: [
        //   IconButton(
        //     onPressed: () {
        //       Navigator.pushNamed(context, RoutesName.ProfileScreen);
        //     },
        //     icon: Icon(
        //       Icons.account_circle_outlined,
        //       color: AppColors.gray,
        //       size: 30,
        //     ),
        //   ),
        // ],
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(12),
          child: Divider(color: Colors.red.shade200),
        ),
      ),
      body: Pages[context.watch<DataProvider>().currentBottomIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: context.watch<DataProvider>().currentBottomIndex,
        unselectedItemColor: AppColors.gray,
        selectedItemColor: AppColors.red,
        showUnselectedLabels: true,
        onTap: (value) {
          context.read<DataProvider>().updateCurrentIndex(value);
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home_outlined),label:"Home"),
          BottomNavigationBarItem(icon: Icon(Icons.explore_outlined),label: "Disconery"),
          BottomNavigationBarItem(icon: Icon(Icons.bookmark),label: "Saved"),
          BottomNavigationBarItem(icon: Icon(Icons.person_outline),label: "Profile"),
        ],
      ),
    );
  }
}
