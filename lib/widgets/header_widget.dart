import 'package:weather_sphere/provider/global_controller.dart';
import 'package:weather_sphere/helper/text_style.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HeaderWidget extends StatefulWidget {
  const HeaderWidget({super.key});

  @override
  State<HeaderWidget> createState() => _HeaderWidgetState();
}

class _HeaderWidgetState extends State<HeaderWidget> {
  final GlobalController globalController = Get.find();

  @override
  void initState() {
    globalController.getAddress(
      globalController.findLatitude().value,
      globalController.findLongitude().value,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 350.w,
      height: 80.h,
      child: Obx(() => Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                  '${globalController.city.value} ${globalController.state.value}',
                  style: AppTextStyle.mulish(
                      fontSize: 22.sp, fontWeight: FontWeight.w700),
                  overflow: TextOverflow.ellipsis),
              Text(
                globalController.currentTime.value,
                style: AppTextStyle.mulish(
                    fontSize: 15.sp, fontWeight: FontWeight.w600),
              ),
            ],
          )),
    );
  }
}
