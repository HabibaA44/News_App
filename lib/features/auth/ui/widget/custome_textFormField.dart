import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/constant/app_colors.dart';

//import 'package:flutter_screenutil/flutter_screenutil.dart';
class Custometextform extends StatelessWidget {
  final String title;
  final String hintTitle;
  final Widget? suffix;
  final Widget? prefix;
  final String? Function(String?)? validate;
  final TextEditingController? controller;
  const Custometextform({
    super.key,
    required this.title,
    required this.hintTitle,
    this.prefix,
    this.suffix,
    this.validate,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: AppColors.gray,
            ),
          ),
          TextFormField(
            cursorColor: AppColors.red,

            controller: controller,
            validator: validate,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            decoration: InputDecoration(
              // contentPadding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
              prefixIcon: prefix,
              suffixIcon: suffix,
              hintText: hintTitle,
              iconColor: AppColors.gray,
              labelStyle: TextStyle(color: AppColors.gray),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: AppColors.red),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
