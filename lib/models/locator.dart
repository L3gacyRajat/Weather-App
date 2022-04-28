import 'dart:convert';
import 'package:http/http.dart';

class WeatherLocation {
   late String city;
   late String temperature;
   late String wind;
    late String type;
    late String humidity;

   WeatherLocation({
      required this.city,
   });

   Future<void> getData() async
   { try{
      Response response = await get(Uri.parse(
          'https://api.openweathermap.org/data/2.5/weather?q=$city&appid=48888cd8a7a93f826963ea8d2f2c329d'));
      Map data = jsonDecode(response.body);

      // temp,humidity
      Map temp_data = data['main'];
      double gettemp = temp_data['temp']-273;
      String getHumidity = temp_data['humidity'].toString();

      //weather type
      List weather_type = data['weather'];
      Map weather_type_data = weather_type[0];
      String gettype = weather_type_data['main'];

      //wind
      Map wind_data = data['wind'];
      double getwind = wind_data['speed'] * 3.6;

      //cityname
      String getCity = data['name'];

      temperature = gettemp.toString();
      humidity = getHumidity;
      wind = getwind.toString();
      type = gettype;
      city = getCity;
   }catch(e)
      {  print(e);
         temperature = "NA";
         humidity = "NA";
         wind = "NA";
         type = "NA";
         city = 'Not Found';
      }

   }


}
