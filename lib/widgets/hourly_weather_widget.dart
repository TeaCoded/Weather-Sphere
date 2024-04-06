import 'package:weather_sphere/data/model/hourly_weather_data.dart';
import 'package:weather_sphere/provider/global_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_sphere/helper/text_style.dart';
import 'package:weather_sphere/helper/colors.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:get/get.dart';

class HourlyWeatherWidget extends StatefulWidget {
  final HourlyWeatherData hourlyWeatherData;
  const HourlyWeatherWidget({super.key, required this.hourlyWeatherData});

  @override
  State<HourlyWeatherWidget> createState() => _HourlyWeatherWidgetState();
}

class _HourlyWeatherWidgetState extends State<HourlyWeatherWidget> {
  RxInt cardIndex = GlobalController().getIndex();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: 10.h),
          child: Text('24-hour forecast',
              style: AppTextStyle.mulish(
                  fontSize: 22.sp, fontWeight: FontWeight.w700)),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 5.h),
          child: SizedBox(
            height: 140.h,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: widget.hourlyWeatherData.hourly.length > 24
                  ? 24
                  : widget.hourlyWeatherData.hourly.length,
              itemBuilder: (context, index) {
                return Obx(() => GestureDetector(
                      onTap: () {
                        cardIndex.value = index;
                      },
                      child: ContainerWidget(
                        index: index,
                        cardIndex: cardIndex.toInt(),
                        time: widget.hourlyWeatherData.hourly[index].dt!,
                        backgroundImage:
                            '${widget.hourlyWeatherData.hourly[index].weather![0].icon}',
                        temp: widget.hourlyWeatherData.hourly[index].temp!,
                        weatherImage:
                            '${widget.hourlyWeatherData.hourly[index].weather![0].icon}',
                        borderColor: cardIndex.value == index
                            ? MyColors.white
                            : MyColors.gradientColor2,
                        description: widget.hourlyWeatherData.hourly[index]
                            .weather![0].description!,
                      ),
                    ));
              },
            ),
          ),
        )
      ],
    );
  }
}

class ContainerWidget extends StatefulWidget {
  final String backgroundImage;
  final String weatherImage;
  final int temp;
  final int time;
  final Color borderColor;
  final int index;
  final int cardIndex;
  final String description;

  const ContainerWidget(
      {super.key,
      required this.time,
      required this.backgroundImage,
      required this.temp,
      required this.weatherImage,
      required this.borderColor,
      required this.index,
      required this.cardIndex,
      required this.description});

  @override
  State<ContainerWidget> createState() => _ContainerWidgetState();
}

class _ContainerWidgetState extends State<ContainerWidget> {
  @override
  Widget build(BuildContext context) {
    String getTime(final hourlytime) {
      DateTime time = DateTime.fromMillisecondsSinceEpoch(hourlytime * 1000);
      String x = DateFormat('jm').format(time);
      return x;
    }

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5),
      height: 150.h,
      width: 135.w,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(
                  'assets/weather_background_color/${widget.backgroundImage}.png'),
              fit: BoxFit.cover),
          borderRadius: BorderRadius.circular(15),
          border: Border.all(width: 5, color: widget.borderColor)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            getTime(widget.time),
            style: AppTextStyle.mulish(
                fontSize: 15.sp, fontWeight: FontWeight.w600),
          ),
          Container(
            height: 50.h,
            width: 50.h,
            margin: EdgeInsets.symmetric(vertical: 10.h),
            child: Image.asset('assets/weather/${widget.weatherImage}.png'),
          ),
          Text(
            '${widget.temp}°C',
            style: AppTextStyle.mulish(
                fontSize: 15.sp, fontWeight: FontWeight.w600),
          ),
          Text(
            widget.description,
            style: AppTextStyle.mulish(
                fontSize: 15.sp, fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }
}
