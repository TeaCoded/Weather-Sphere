import 'package:weather_sphere/data/model/weather_data.dart';
import 'package:weather_sphere/data/fetch_data.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'package:intl/intl.dart';
import 'package:get/get.dart';

class GlobalController extends GetxController {
  static GlobalController get instance => Get.find();
  var city = ''.obs;
  var state = ''.obs;
  RxString currentTime =
      DateFormat('EEEE, d MMMM y').format(DateTime.now()).obs;
  final RxBool _isLoading = true.obs;
  final RxDouble _latitude = 0.0.obs;
  final RxDouble _longitude = 0.0.obs;
  final RxInt _currentIndex = 0.obs;

  RxBool checkLoading() => _isLoading;

  RxDouble findLatitude() => _latitude;

  RxDouble findLongitude() => _longitude;

  final weatherData = WeatherData().obs;

  WeatherData getWeatherData() {
    return weatherData.value;
  }

  @override
  void onInit() async {
    if (_isLoading.isTrue) {
      findLocation();
    }
    super.onInit();
    updateClock();
  }

  findLocation() async {
    bool isServiceEnabled;
    LocationPermission locationPermission;

    isServiceEnabled = await Geolocator.isLocationServiceEnabled();

    if (!isServiceEnabled) {
      return Future.error("Location not Enabled");
    }

    locationPermission = await Geolocator.checkPermission();

    if (locationPermission == LocationPermission.deniedForever) {
      return Future.error("Location permission are denied Forever");
    } else if (locationPermission == LocationPermission.denied) {
      locationPermission = await Geolocator.requestPermission();
      if (locationPermission == LocationPermission.denied) {
        return Future.error("Location permission is denied");
      }
    }

    return await Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.high)
        .then((value) {
      _latitude.value = value.latitude;
      _longitude.value = value.longitude;
      return FetchWeatherAPI()
          .processData(value.latitude, value.longitude)
          .then((value) {
        weatherData.value = value;
        _isLoading.value = false;
      });
    });
  }

  void getAddress(lat, lon) async {
    List<Placemark> placemark = await placemarkFromCoordinates(lat, lon);
    Placemark place = placemark[0];
    city.value = place.locality!;
    state.value = place.administrativeArea!;
  }

  void updateClock() {
    Future.delayed(const Duration(seconds: 1), () {
      currentTime.value = DateFormat('EEEE, d MMMM y').format(DateTime.now());
      updateClock();
    });
  }

  RxInt getIndex() {
    return _currentIndex;
  }
}
