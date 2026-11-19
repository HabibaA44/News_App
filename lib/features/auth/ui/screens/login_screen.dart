import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/constant/app_colors.dart';
import 'package:flutter_application_1/core/help/app_validator.dart';
import 'package:flutter_application_1/core/rautes/routes_name.dart';
import 'package:flutter_application_1/features/auth/ui/cubit/auth_cubit.dart';
import 'package:flutter_application_1/features/auth/ui/cubit/auth_state.dart';
//import 'package:flutter_application_1/features/auth/ui/screens/layout_screen.dart';
//import 'package:flutter_application_1/features/auth/ui/screens/home_screen.dart' as AppNames;
import 'package:flutter_application_1/features/auth/ui/widget/costome_bottonWithIcon.dart';
import 'package:flutter_application_1/features/auth/ui/widget/custome_botton.dart';
import 'package:flutter_application_1/features/auth/ui/widget/custome_textFormField.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;
  late final AuthCubit _authCubid;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _authCubid = context.read<AuthCubit>();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text(
              "THE GAZETTE",
              style: TextStyle(
                color: AppColors.red,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(8),
            child: Divider(color: Colors.red.shade200),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.only(top: 40.h, left: 12.w, right: 12.w),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.r),
              border: Border.all(color: Colors.red.shade200),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                  //mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 20.h),
                    Text(
                      "Welcome Back",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    SizedBox(height: 20.h),
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        "Access Your Subscription and Saved Stories",
                        // style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ),
                    SizedBox(height: 20.h),
                    Custometextform(
                      controller: _emailController,
                      title: "EMAIL ADDRESS",
                      hintTitle: "Enter You Email",
                      prefix: Icon(Icons.email_outlined),
                      validate: (value) {
                        return AppValidator.validateEmail(value);
                      },
                    ),
                    Custometextform(
                      controller: _passwordController,
                      title: "PASSWORD",
                      hintTitle: " Enter Your Password",
                      prefix: Icon(Icons.lock_outline),
                      validate: (value) {
                        return AppValidator.validatePassword(value);
                      },
                    ),
                    SizedBox(height: 15.h),
                    Align(
                      alignment: Alignment.topRight,
                      child: Text(
                        "FORGET PASSWORD?",
                        style: TextStyle(
                          color: AppColors.red,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(height: 15.h),
                    BlocListener<AuthCubit, AuthState>(
                      listener: (context, state) {
                        if (state is AuthSuccess) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text("Login Success"),
                              backgroundColor: Colors.green,
                            ),
                          );
                          Navigator.pushReplacementNamed(
                            context,
                            RoutesName.LayoutScreen,
                          );
                        } else if (state is AuthFailure) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              padding: EdgeInsets.symmetric(horizontal: 12.w),
                              content: Text(
                                "Login Field ${state.errorMassege}",
                              ),
                              backgroundColor: Colors.red,
                            ),
                          );
                        }
                      },
                      child: CustomeBotton(
                        title: "Log In",
                        onTap: () async {
                          await _authCubid.Login(
                            email: _emailController.text,
                            password: _passwordController.text,
                          );
                        },
                      ),
                    ),

                    SizedBox(height: 15.h),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 9),
                      child: Row(
                        children: [
                          Expanded(child: Divider(color: Colors.red.shade200)),
                          SizedBox(width: 6),
                          Text(
                            "OR CONTIANUE WITH",
                            style: TextStyle(color: AppColors.gray),
                          ),
                          SizedBox(width: 6),
                          Expanded(child: Divider(color: Colors.red.shade200)),
                        ],
                      ),
                    ),
                    SizedBox(height: 15.h),
                    CustomeIconbotton(
                      title: " GOOGLE",
                      icon: Icons.account_circle_outlined,
                    ),
                    SizedBox(height: 12.h),
                    // CustomeIconbotton(
                    //   title: "Continue With IOS",
                    //   icon: Icons.account_circle_outlined,
                    // ),
                    SizedBox(height: 14.h),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Divider(color: Colors.red.shade200),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "New To The Gazette?",
                          style: TextStyle(color: AppColors.gray, fontSize: 16),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pushNamed(
                              context,
                              RoutesName.RegisterScreen,
                            );
                          },
                          child: Text(
                            "Sign In",
                            style: TextStyle(
                              color: AppColors.red,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
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
        ),
      ),
    );
  }
}
