// ignore: file_names
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weatherapp/weatherModel.dart';

class WeatherData{


  Future<Weather> getData(var latitude, var longitude) async{
    var uriCall = Uri.parse('http://api.weatherapi.com/v1/current.json?key=dff66a3b28774c3d80910620230602&q=$latitude,$longitude&aqi=no');

    var response = await http.get(uriCall);
    var body = jsonDecode(response.body);
    return Weather.fromJson(body);
  }

}