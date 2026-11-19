import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/core/constant/app_colors.dart';
import 'package:flutter_application_1/core/help/app_validator.dart';
import 'package:flutter_application_1/core/rautes/routes_name.dart';
import 'package:flutter_application_1/features/auth/ui/cubit/auth_cubit.dart';
import 'package:flutter_application_1/features/auth/ui/cubit/auth_state.dart';
import 'package:flutter_application_1/features/auth/ui/widget/costome_bottonWithIcon.dart';
import 'package:flutter_application_1/features/auth/ui/widget/custome_botton.dart';
import 'package:flutter_application_1/features/auth/ui/widget/custome_textFormField.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;
  late final TextEditingController _nameController;
  late final AuthCubit _authCubid;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _nameController = TextEditingController();

    _authCubid = context.read<AuthCubit>();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 10.h),
                Text(
                  "Join The Conversation",
                  style: TextStyle(
                    color: AppColors.black,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10.h),
                Text(
                  "In-depth reporting and rigorous analysis ,delivered to your inbox",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: AppColors.gray, fontSize: 16),
                ),
                SizedBox(height: 10.h),
                Custometextform(
                  controller: _nameController,
                  title: "FULL NAME",
                  hintTitle: "Enter your Name",
                  prefix: Icon(Icons.person),
                  validate: (value) {
                    if (value == null) {
                      return 'Pls Enter Your Name';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 10.h),
                Custometextform(
                  controller: _emailController,
                  title: "EMAIL",
                  hintTitle: "Enter your Email",
                  prefix: Icon(Icons.email),
                  validate: (value) {
                    return AppValidator.validateEmail(value);
                  },
                ),
                SizedBox(height: 10.h),
                Custometextform(
                  controller: _passwordController,
                  title: "PASSWORD",
                  hintTitle: "Enter your Password",
                  prefix: Icon(Icons.lock_outline),
                  suffix: Icon(Icons.visibility_off_outlined),
                  validate: (value) {
                    return AppValidator.validatePassword(value);
                  },
                ),

                SizedBox(height: 10.h),
                Row(
                  children: [
                    Container(
                      width: 25.w,
                      height: 25.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.r),
                        color: AppColors.white,
                        border: Border.all(color: AppColors.gray, width: 1),
                      ),
                    ),

                    SizedBox(width: 6.w),
                    Expanded(
                      child: Text(
                        "i agree to the Term of Service and Privacy Policy",
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 15.h),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: BlocListener<AuthCubit, AuthState>(
                    listener: (context, state) {
                      if (state is AuthSuccess) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(" Register Success"),
                            backgroundColor: Colors.green,
                          ),
                        );
                        Navigator.pushReplacementNamed(
                          context,
                          RoutesName.LayoutScreen,
                        );
                      }
                      if (state is AuthFailure) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              " Register falid ${state.errorMassege}",
                            ),
                            backgroundColor: Colors.red,
                          ),
                        );
                      }
                    },

                    child: CustomeBotton(
                      onTap: () async {
                        await _authCubid.Register(
                          email: _emailController.text,
                          password: _passwordController.text,
                          name: _nameController.text,
                        );
                      },
                      title: "Create Account",
                    ),
                  ),
                ),
                SizedBox(height: 15.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12.w),
                  child: Row(
                    children: [
                      Expanded(child: Divider(color: Colors.red.shade100)),
                      SizedBox(width: 6.w),
                      Text(
                        "Or continue with",
                        style: TextStyle(fontSize: 15, color: AppColors.gray),
                      ),
                      SizedBox(width: 6.w),
                      Expanded(child: Divider(color: Colors.red.shade100)),
                    ],
                  ),
                ),
                SizedBox(height: 15.h),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: CustomeIconbotton(
                    title: "GOOGLE",
                    icon: Icons.account_circle_outlined,
                  ),
                ),

                SizedBox(height: 8),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already have an account?",
                      style: TextStyle(color: AppColors.gray, fontSize: 18),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        "Log In",
                        style: TextStyle(
                          color: AppColors.red,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
