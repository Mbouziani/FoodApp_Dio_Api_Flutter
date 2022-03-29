// ignore_for_file: file_names, non_constant_identifier_names, unused_local_variable

import 'package:dio/dio.dart';
import 'package:themealdbdemoapi/Model/Meal_Model.dart';

class MealData {
  static Future<List<MealModel>> GetMealByFirstChar(
      String FirstCharachter) async {
    Response response = await Dio().get(
        'https://www.themealdb.com/api/json/v1/1/search.php?f=$FirstCharachter');

    return (response.data['meals'] as List)
        .map((e) => MealModel.fromJson(e))
        .toList();
  }

  static Future<List<MealModel>> GetMealByID(String ID) async {
    Response response = await Dio()
        .get('https://www.themealdb.com/api/json/v1/1/lookup.php?i=$ID');

    return (response.data['meals'] as List)
        .map((e) => MealModel.fromJson(e))
        .toList();
  }

  static Future<void> printMealByID(String ID) async {
    Response response = await Dio()
        .get('https://www.themealdb.com/api/json/v1/1/lookup.php?i=$ID');

    print((response.data['meals'] as List)
        .map((e) => MealModel.fromJson(e))
        .toList());
  }
}
