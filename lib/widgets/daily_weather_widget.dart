import 'package:weather_sphere/data/model/daily_weather_data.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_sphere/helper/text_style.dart';
import 'package:weather_sphere/helper/colors.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DailyWeatherWidget extends StatefulWidget {
  final DailyWeatherData dailyWeatherData;
  const DailyWeatherWidget({super.key, required this.dailyWeatherData});

  @override
  State<DailyWeatherWidget> createState() => _DailyWeatherWidgetState();
}

class _DailyWeatherWidgetState extends State<DailyWeatherWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 360.h,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 10.h),
            child: Text('7-day forecast',
                style: AppTextStyle.mulish(
                    fontSize: 22.sp, fontWeight: FontWeight.w700)),
          ),
          SizedBox(
            height: 290.h,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: widget.dailyWeatherData.daily.length > 7
                  ? 7
                  : widget.dailyWeatherData.daily.length,
              itemBuilder: (context, index) {
                return ContainerWidgetDaily(
                  weatherImage:
                      '${widget.dailyWeatherData.daily[index].weather![0].icon}',
                  mintemp:
                      widget.dailyWeatherData.daily[index].temp!.min!.round(),
                  maxtemp:
                      widget.dailyWeatherData.daily[index].temp!.max!.round(),
                  day: widget.dailyWeatherData.daily[index].dt!,
                  sunrise: widget.dailyWeatherData.daily[index].sunrise!,
                  sunset: widget.dailyWeatherData.daily[index].sunset!,
                  description:
                      '${widget.dailyWeatherData.daily[index].weather![0].description}',
                  cloud: widget.dailyWeatherData.daily[index].clouds!,
                  wind: widget.dailyWeatherData.daily[index].windSpeed!.round(),
                  uvi: widget.dailyWeatherData.daily[index].uvi!.round(),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class ContainerWidgetDaily extends StatefulWidget {
  final String weatherImage;
  final int mintemp;
  final int maxtemp;
  final int day;
  final int sunrise;
  final int sunset;
  final int cloud;
  final int wind;
  final int uvi;
  final String description;
  const ContainerWidgetDaily({
    super.key,
    required this.weatherImage,
    required this.mintemp,
    required this.maxtemp,
    required this.day,
    required this.sunrise,
    required this.sunset,
    required this.description,
    required this.cloud,
    required this.wind,
    required this.uvi,
  });

  @override
  State<ContainerWidgetDaily> createState() => _ContainerWidgetDailyState();
}

class _ContainerWidgetDailyState extends State<ContainerWidgetDaily> {
  @override
  Widget build(BuildContext context) {
    String getdayTime(final day) {
      DateTime time = DateTime.fromMillisecondsSinceEpoch(day * 1000);
      String x = DateFormat('EEE').format(time);
      return x;
    }

    String getsunsriseTime(final sunrise) {
      DateTime time = DateTime.fromMillisecondsSinceEpoch(sunrise * 1000);
      String x = DateFormat('jm').format(time);
      return x;
    }

    String getsunsetTime(final sunset) {
      DateTime time = DateTime.fromMillisecondsSinceEpoch(sunset * 1000);
      String x = DateFormat('jm').format(time);
      return x;
    }

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5.w),
      height: 300.h,
      width: 145.w,
      decoration: BoxDecoration(
          border: Border.all(width: 2, color: Colors.white),
          color: MyColors.weatherContainer,
          borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: EdgeInsets.only(top: 2.h, bottom: 2.h, left: 4.w, right: 4.w),
        child: Column(
          children: [
            Text(
              getdayTime(widget.day),
              style: AppTextStyle.mulish(
                  fontSize: 15.sp, fontWeight: FontWeight.w600),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 4.h),
              child: Text(
                'max ${widget.maxtemp}°c',
                style: AppTextStyle.mulish(
                    fontSize: 15.sp, fontWeight: FontWeight.w600),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 4.h),
              child: Text(
                'min ${widget.mintemp}°c',
                style: AppTextStyle.mulish(
                    fontSize: 15.sp, fontWeight: FontWeight.w600),
              ),
            ),
            Container(
              height: 30.h,
              width: 30.h,
              margin: EdgeInsets.symmetric(vertical: 10.h),
              child: Image.asset('assets/weather/${widget.weatherImage}.png'),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 4.h),
              child: Text(
                widget.description,
                style: AppTextStyle.mulish(
                    fontSize: 15.sp, fontWeight: FontWeight.w600),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 4.h),
              child: Row(
                children: [
                  SizedBox(
                    height: 25.h,
                    width: 25.h,
                    child: Image.asset('assets/icons/sunrise.png'),
                  ),
                  const Spacer(),
                  Text(
                    getsunsriseTime(widget.sunrise),
                    style: AppTextStyle.mulish(
                        fontSize: 15.sp, fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 4.h),
              child: Row(
                children: [
                  SizedBox(
                    height: 25.h,
                    width: 25.h,
                    child: Image.asset('assets/icons/sunset.png'),
                  ),
                  const Spacer(),
                  Text(
                    getsunsetTime(widget.sunset),
                    style: AppTextStyle.mulish(
                        fontSize: 15.sp, fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 4.h),
              child: Row(
                children: [
                  SizedBox(
                    height: 25.h,
                    width: 23.h,
                    child: Image.asset('assets/icons/cloud.png'),
                  ),
                  const Spacer(),
                  Text(
                    '${widget.cloud}%',
                    style: AppTextStyle.mulish(
                        fontSize: 15.sp, fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 4.h),
              child: Row(
                children: [
                  SizedBox(
                    height: 25.h,
                    width: 25.h,
                    child: Image.asset('assets/icons/wind.png'),
                  ),
                  const Spacer(),
                  Text(
                    '${widget.wind} m/s',
                    style: AppTextStyle.mulish(
                        fontSize: 15.sp, fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 4.h),
              child: Row(
                children: [
                  SizedBox(
                    height: 25.h,
                    width: 25.h,
                    child: Image.asset('assets/icons/uvi.png'),
                  ),
                  const Spacer(),
                  Text(
                    '${widget.uvi}',
                    style: AppTextStyle.mulish(
                        fontSize: 15.sp, fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
