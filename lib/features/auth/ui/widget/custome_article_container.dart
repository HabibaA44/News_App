import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/constant/app_colors.dart';

class CustomeArticleContainer extends StatelessWidget {
  final IconData icon;
  final VoidCallback? onTap;
  final Color? backgroundColor;
  final Color? iconColor;
 // final VoidCallback? onTap;
  const CustomeArticleContainer({super.key ,required this.icon ,this.onTap ,this.backgroundColor,this.iconColor });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 50,
      height: 50,
      child: ElevatedButton(
        
      style: ElevatedButton.styleFrom(
        iconColor:iconColor?? AppColors.black,
        backgroundColor:backgroundColor?? AppColors.white,
      side: BorderSide(color:Colors.red.shade200),
        padding: EdgeInsets.zero,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25))),
        onPressed:(){
          onTap?.call();
        }
          //onTap
          , child:Icon(icon,size: 25,)),
    );
  }
}