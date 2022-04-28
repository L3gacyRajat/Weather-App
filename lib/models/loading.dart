import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/models/locator.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
   String cityname;
   Loading({Key? key, required this.cityname}) : super(key: key);
   @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  late String temp;
  late String hum;
  late String city;
  late String speed;
  String typew='Clear';
  String typewall = 'sunny.jpg';
  String daynight = 'Day';
  String daynightlogo = 'sun';
  String svglogo = 'sun.svg';

  void startApp() async {
    WeatherLocation instance = WeatherLocation(city: widget.cityname);
    await instance.getData();
    city = instance.city;
    temp = instance.temperature;
    hum = instance.humidity;
    speed = instance.wind;
    typew = instance.type;
    final String checkDateTime =
    DateFormat('kk').format(DateTime.now()).toString();
    if (checkDateTime=='21'||
        checkDateTime=='22'||
        checkDateTime=='23'||
        checkDateTime=='24'|| checkDateTime=='00'
        || checkDateTime=='1'|| checkDateTime=='2'
        || checkDateTime=='3'|| checkDateTime=='4'
    )
      {
        daynight = 'Night';
        daynightlogo = 'moon';
        typewall =  'night.jpg';
      }
    if (typew=='Clear' && daynight=='Day')
      {
        typewall = 'sunny.jpg';
        svglogo = 'sun.svg';
      }
    if (typew=='Smoke' && daynight=='Day')
    {
      typewall = 'haze.png';
      svglogo = 'haze.svg';
    }
    if (typew=='Haze' && daynight=='Day')
    {
      typewall = 'haze.png';
      svglogo = 'haze.svg';
    }
    if (typew=='Clouds' && daynight=='Day')
    {
      typewall = 'cloudy.jpeg';
      svglogo = 'cloudy.svg';
    }
    if (typew=='Rain' && daynight=='Day')
    {
      typewall = 'rainy.jpg';
      svglogo = 'rain.svg';
    }
    if (typew=='Clear' && daynight=='Night')
    {
      typewall = 'night.jpg';
      svglogo = 'moon.svg';
    }
    if (typew=='Rain' && daynight=='Night')
    {
      typewall = 'rainynight.png';
      svglogo = 'rain.svg';
    }
    if (typew=='Clouds' && daynight=='Night')
    {
      typewall = 'cloudynight.png';
      svglogo = 'cloudy.svg';
    }
    if (typew=='Haze' && daynight=='Night')
    {
      typewall = 'night.jpg';
      svglogo = 'haze.svg';
    }

    Future.delayed(
      Duration(seconds: 3),
      () {
        Navigator.pushReplacementNamed(
          context,
          '/home',
          arguments: {
            "city_value": city,
            "temp_value": temp,
            "hum_value": hum,
            "air_speed_value": speed,
            "des_value": typew,
            "typewall_value": typewall,
            "daynight_value": daynight,
            "daynightlogo_value": daynightlogo,
            "svglogo_value" : svglogo,
          },
        );
      },
    );
  }

  @override
  void initState() {
    startApp();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              "assets/mlogo.png",
              height: 240,
              width: 240,
            ),
            Text(
              "Weather",
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w500,
                  color: Colors.white),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Made By Rajat \n L3-Production",
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: Colors.white),
            ),
            SizedBox(
              height: 30,
            ),
            SpinKitWave(
              color: Colors.white,
              size: 50.0,
            ),
          ],
        ),
      ),
      backgroundColor: Colors.black26,
    );
  }
}
