import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/core/constant/app_colors.dart';
import 'package:flutter_application_1/features/auth/ui/cubit/auth_cubit.dart';
import 'package:flutter_application_1/features/auth/ui/cubit/auth_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomeBotton extends StatelessWidget {
  final String title;
  final VoidCallback? onTap;
  const CustomeBotton({super.key, required this.title, this.onTap});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 340.w,
      child: BlocBuilder<AuthCubit, AuthState>(
        buildWhen: (previous, current) {
          return (previous is AuthLoading) != (current is AuthLoading);
        },
        builder: (context, state) {
          return ElevatedButton(
            style: ButtonStyle(
              backgroundColor: WidgetStatePropertyAll(AppColors.red),
              shape: WidgetStatePropertyAll(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6.r),
                ),
              ),
            ),
            onPressed: onTap,
            child: Padding(
              padding: const EdgeInsets.only(top: 14, bottom: 14),
              child: (state is AuthLoading)
                  ? CircularProgressIndicator(color: AppColors.white)
                  : Text(
                      title,
                      style: TextStyle(color: Colors.white, fontSize: 16.sp),
                    ),
            ),
          );
        },
        // child:
      ),
    );
  }
}
