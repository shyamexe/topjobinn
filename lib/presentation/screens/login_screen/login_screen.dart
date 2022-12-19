import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:topjobinn/core/constants/colors.dart';
import 'package:topjobinn/logic/login_cubit/login_cubit.dart';
import 'package:topjobinn/presentation/router/app_router.dart';

import 'widgets/login_placeholder.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final emailController=TextEditingController();
  final passwordController=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit,LoginState>(
      listener: (context, loginState) {
        if (loginState is LoginSuccess) {
          Navigator.pushNamedAndRemoveUntil(context, AppRouter.home, (route) => false);
        }
      },
      builder: (context,loginState) {
        return Scaffold(
          body: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  
                  const LoginPlaceHolder(),
                  Container(
                    height: 482.h,
                    padding: EdgeInsets.all(42.w),
                    decoration: const BoxDecoration(
                        color: AppColors.primaryColor,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(24),
                          topRight: Radius.circular(24),
                        )),
                    child: Column(
                      children: [
                        SizedBox(
                            height: 45.w,
                            width: 292.w,
                            child: Container(
                              padding: const EdgeInsets.fromLTRB(10, 2, 10, 2),
                              decoration: BoxDecoration(
                                color: const Color(0xff140F26).withOpacity(.64),
                                borderRadius: BorderRadius.circular(25),
                              ),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: TextField(
                                      controller: emailController,
                                      decoration: InputDecoration(
                                        contentPadding:
                                            EdgeInsets.symmetric(horizontal: 15.w),
                                        border: InputBorder.none,
                                        hintText: "Your email / number",
                                        hintStyle: TextStyle(
                                            color: Colors.white.withOpacity(.40),
                                            fontWeight: FontWeight.w300),
                                      ),
                                      style: TextStyle(
                                          color: Colors.white.withOpacity(.70),
                                          fontWeight: FontWeight.w300),
                                    ),
                                  ),
                                  Container(
                                    height: 25.w,
                                    width: 25.w,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(13),
                                        color: AppColors.primaryColor),
                                    child: const Icon(
                                      Icons.done_rounded,
                                      color: Colors.white,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 16.w,
                                  )
                                ],
                              ),
                            )),
                        SizedBox(
                          height: 16.w,
                        ),
                        SizedBox(
                            height: 45.w,
                            width: 292.w,
                            child: Container(
                              padding: const EdgeInsets.fromLTRB(10, 2, 10, 2),
                              decoration: BoxDecoration(
                                color: const Color(0xff140F26).withOpacity(.64),
                                borderRadius: BorderRadius.circular(25),
                              ),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: TextField(
                                      controller: passwordController,
                                      decoration: InputDecoration(
                                        contentPadding:
                                            EdgeInsets.symmetric(horizontal: 15.w),
                                        border: InputBorder.none,
                                        hintText: "Your email / number",
                                        hintStyle: TextStyle(
                                            color: Colors.white.withOpacity(.40),
                                            fontWeight: FontWeight.w300),
                                      ),
                                      style: TextStyle(
                                          color: Colors.white.withOpacity(.70),
                                          fontWeight: FontWeight.w300),
                                    ),
                                  ),
                                  Container(
                                    height: 25.w,
                                    width: 25.w,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    child: const Icon(
                                      Icons.visibility_off_outlined,
                                      color: Colors.white,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 16.w,
                                  )
                                ],
                              ),
                            )),
                        SizedBox(
                          height: 20.h,
                        ),
                        SizedBox(
                          height: 44.w,
                          width: 292.w,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white,
                                elevation: 0,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18))),
                            onPressed: () {
                              context.read<LoginCubit>().signInWithEmail(email: emailController.text, password: passwordController.text);
                            },
                            child: Text(
                              'LOGIN',
                              style: TextStyle(
                                  color: AppColors.primaryColor,
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        Row(
                          children: [
                            SizedBox(
                                height: 44.w,
                                width: 138.w,
                                child: ElevatedButton.icon(
                                  icon:
                                      SvgPicture.asset('assets/svg/googleIcon.svg'),
                                  onPressed: () {
                                    context.read<LoginCubit>().signInWithGoogle();
                                  },
                                  style: ElevatedButton.styleFrom(
                                    elevation: 0,
                                    backgroundColor: Colors.white,
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(18.r)),
                                  ),
                                  label: Text(
                                    'login with Google',
                                    style: TextStyle(
                                        fontSize: 10.sp,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w300),
                                  ),
                                )),
                            const Spacer(),
                            SizedBox(
                                height: 44.w,
                                width: 138.w,
                                child: ElevatedButton.icon(
                                  icon:
                                      SvgPicture.asset('assets/svg/appleIcon.svg'),
                                  onPressed: () {},
                                  style: ElevatedButton.styleFrom(
                                    elevation: 0,
                                    backgroundColor: Colors.black,
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(18.r)),
                                  ),
                                  label: Text(
                                    'login with Google',
                                    style: TextStyle(
                                        fontSize: 10.sp,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w300),
                                  ),
                                )),
                          ],
                        ),
                        SizedBox(
                          height: 40.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            SizedBox(
                              width: 70.w,
                              child: Divider(color: Colors.white,)),
                            Text(
                              'OR',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 14.sp,fontWeight: FontWeight.w400),
                            ),
                            SizedBox(
                              width: 70.w,
                              
                              child: Divider(color: Colors.white,)),

                          ],
                        ),
                        SizedBox(height: 30.h,),
                        SizedBox(
                          height: 48.w,
                          width: 294.w,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18.sp),
                                side: BorderSide(color: Colors.white)
                              )
                            ),
                            onPressed: () {
                            
                          }, child: Text('CREATE AN ACCOUNT',style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w400,
                            fontSize: 14.sp
                          ),)),
                        ),
                        SizedBox(height: 20.h,),
                        Text('FORGOT PASSWORD?',style: TextStyle(
                          color: Colors.grey.shade100,
                          fontSize: 13.sp,fontWeight: FontWeight.w600
                        ),)
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      }
    );
  }
}
