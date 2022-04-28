import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

  class SingleWeather extends StatefulWidget {
    const SingleWeather({Key? key}) : super(key: key);

  @override
  State<SingleWeather> createState() => _SingleWeatherState();
}

class _SingleWeatherState extends State<SingleWeather> {
  String _timeString='';

  void initState() {
    // TODO: implement initState
    super.initState();
    Timer.periodic(Duration(seconds: 1), (Timer t) => _getTime());
  }
  void _getTime() {
    final String formattedDateTime =
    DateFormat('KK:mm a dd-MM-yyyy').format(DateTime.now()).toString();
    setState(() {
      _timeString = formattedDateTime;
      print(_timeString);
    });
  }
    @override
    Widget build(BuildContext context) {
      Map info = ModalRoute.of(context)!.settings.arguments as Map;

        String city = info["city_value"];
        String temp = info["temp_value"];
        String hum = info["hum_value"];
        String wind = info["air_speed_value"];
        String type = info["des_value"];
        int windlength = info["air_speed_value"].toString().length;
        if (windlength > 4)
          {
            windlength = 4;
          }
      String daynight = info["daynight_value"];
      String daynightlogo =info["daynightlogo_value"];
      String svglogo = info["svglogo_value"];
      if(temp == "NA")
      {
        print("NA");
      }
      else
      {
        temp = info["temp_value"].toString().substring(0,2);
        wind = info["air_speed_value"].toString().substring(0,windlength);
      }

      return Container(
        padding: EdgeInsets.all(20),
        child: Column(
          // All Column Boss
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      // Top Text
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 120,
                        ),
                        Text(city,
                          style: GoogleFonts.lato(
                            fontSize: 35,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          _timeString.toString(),
                          style: GoogleFonts.lato(
                            fontSize: 15,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 220,
                    ),
                    Column(
                      // Bottom Text
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '$temp\u2103',
                          style: GoogleFonts.lato(
                            fontSize: 80,
                            fontWeight: FontWeight.w300,
                            color: Colors.white,
                          ),
                        ),
                        Row(
                          children: [
                            SvgPicture.asset(
                              'assets/$daynightlogo.svg',
                              height: 30,
                              width: 30,
                              color: Colors.white,
                            ),
                            SizedBox(
                              width: 7,
                            ),
                            Text(
                              daynight,
                              style: GoogleFonts.lato(
                                fontSize: 25,
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Column(
              // Bottom icons
              children: [
                Container(
                  margin: EdgeInsets.symmetric(vertical: 40),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.white30,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Text(
                            'Wind',
                            style: GoogleFonts.lato(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            wind,
                            style: GoogleFonts.lato(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            'Km/h',
                            style: GoogleFonts.lato(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          Stack(
                            children: [
                              Container(
                                height: 5,
                                width: 45,
                                color: Colors.white38,
                              ),
                              Container(
                                height: 5,
                                width: 10,
                                color: Colors.greenAccent,
                              ),
                            ],
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Text(
                            type,
                            style: GoogleFonts.lato(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(
                            height:10,
                          ),
                          Container(
                            child: SvgPicture.asset(
                              'assets/$svglogo',
                              height: 35,
                              width: 30,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(
                            height:10,
                          ),
                          Stack(
                            children: [
                              Container(
                                height: 5,
                                width: 45,
                                color: Colors.white38,
                              ),
                              Container(
                                height: 5,
                                width: 10,
                                color: Colors.yellowAccent,
                              ),
                            ],
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Text(
                            'Humidity',
                            style: GoogleFonts.lato(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            hum,
                            style: GoogleFonts.lato(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            '%',
                            style: GoogleFonts.lato(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          Stack(
                            children: [
                              Container(
                                height: 5,
                                width: 45,
                                color: Colors.white38,
                              ),
                              Container(
                                height: 5,
                                width: 12,
                                color: Colors.redAccent,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    }
}
  