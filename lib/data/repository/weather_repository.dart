import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:whether_app/data/data_provider/weather_data_provider.dart';
import 'package:whether_app/models/weather_model.dart';

class WeatherRepository{
  final WeatherDataProvider weatherDataProvider;

  WeatherRepository( this.weatherDataProvider);
  Future<WeatherModel> getCurrentWeather() async{
    try {
      String cityName = 'Patna';
      final weatherData= await weatherDataProvider.getCurrentWeather(cityName);
      final data = jsonDecode(weatherData);
      print("MY DATA : $data");
      if (data['cod'] != '200') {
        throw 'An unexpected error occurred';
      }
      return WeatherModel.fromMap(data);
    }
    catch(e, stacktrace){
      debugPrint("ERROR : $e TRACE: $stacktrace");
      throw e.toString();
    }
  }
}