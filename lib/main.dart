import 'package:weather_app/models/loading.dart';
import 'package:flutter/material.dart';
import 'models/weather_home.dart';

void main()


{
  runApp(const MyApp());
}
class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      routes: {
        "/home": (context) => WeatherApp(),
        "/loading": (context) => Loading(cityname: 'Delhi',),
      },
     home: Loading(cityname: 'Delhi',),
    );
  }
}

