import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_sphere/helper/text_style.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:weather_sphere/helper/colors.dart';
import 'package:flutter/material.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 670.h,
        decoration: BoxDecoration(
            gradient: LinearGradient(
          colors: [
            MyColors.gradientColor1,
            MyColors.gradientColor2,
          ],
        )),
        child: SafeArea(
          child: Scaffold(
              backgroundColor: Colors.transparent,
              body: SizedBox(
                height: 690.h,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 10.h,
                    ),
                    Text(
                      'Weather Sphere',
                      style: AppTextStyle.chivo(fontSize: 25.sp),
                    ),
                    const Spacer(),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SpinKitFadingCube(color: MyColors.white),
                        SizedBox(
                          height: 10.h,
                        ),
                        Text(
                          'Loading',
                          style: AppTextStyle.chivo(fontSize: 25.sp),
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        Text(
                          'Please Wait',
                          style: AppTextStyle.chivo(fontSize: 25.sp),
                        )
                      ],
                    ),
                    const Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Created by TeaCoded',
                          style: AppTextStyle.germaniaOne(),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 2.h,
                    )
                  ],
                ),
              )),
        ));
  }
}
