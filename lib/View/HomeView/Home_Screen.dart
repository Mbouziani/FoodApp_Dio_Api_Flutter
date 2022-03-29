// ignore_for_file: non_constant_identifier_names, must_be_immutable, avoid_print

import 'package:flutter/material.dart';
import 'package:themealdbdemoapi/Controler/Area_Data.dart';
import 'package:themealdbdemoapi/Controler/Categorie_Data.dart';
import 'package:themealdbdemoapi/Controler/Ingredient_Data.dart';
import 'package:themealdbdemoapi/View/HomeView/HomeBox/Ads_Box.dart';
import 'package:themealdbdemoapi/View/HomeView/HomeBox/Categorie_Box.dart';
import 'package:themealdbdemoapi/View/HomeView/HomeBox/CroupPhoto_Box.dart';
import 'package:themealdbdemoapi/View/HomeView/HomeBox/Food_Box.dart';
import 'package:themealdbdemoapi/View/HomeView/HomeBox/Header_Box.dart';
import 'package:themealdbdemoapi/View/HomeView/HomeBox/Item_Box.dart';
import 'package:themealdbdemoapi/View/HomeView/HomeBox/MostWatched_Box.dart';
import 'package:themealdbdemoapi/View/HomeView/HomeBox/Search_Box.dart';
import 'package:themealdbdemoapi/View/Categorie_Screen.dart';
import 'package:themealdbdemoapi/View/SeeAllMeal_Screen.dart';

import '../../Controler/Meal_Data.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //MealData.printMealByID('52770');
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        physics: const BouncingScrollPhysics(),
        shrinkWrap: true,
        children: [
          const HeaderBox(),
          // const SearchBox(),
          // const SizedBox(height: 10),
          AdsBox(revere: false),
          ItemsBox(
            bkg: Colors.black,
            futureList: IngredientData.GetIngredientTitle(),
            filterType: 'Ingredient',
          ),
          CategorieBox(
            BoxTitle: 'Categories',
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => const CategorieScreen()));
            },
          ),
          FoodBox(
              FirstChar: 'c',
              BoxTitle: 'Popular Meals',
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => SeeAllMeals(
                              ScreenTitle: 'Popular Meals',
                              firstChar: 'c',
                            )));
              }),
          FoodBox(
              FirstChar: 'm',
              BoxTitle: 'Recent Search',
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => SeeAllMeals(
                              ScreenTitle: 'Recent Search',
                              firstChar: 'm',
                            )));
              }),
          GroupPhotoBox(
            BoxTitle: 'Our Teams',
            onPressed: () {
              print('Go To Photo Screen');
            },
          ),
          ItemsBox(
            bkg: Colors.black,
            futureList: AreaData.GetArea(),
            filterType: 'Area',
          ),
          FoodBox(
              FirstChar: 'l',
              BoxTitle: 'Top Reviews',
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => SeeAllMeals(
                              ScreenTitle: 'Top Reviews',
                              firstChar: 'l',
                            )));
              }),
          FoodBox(
              FirstChar: 'b',
              BoxTitle: 'Top Search',
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => SeeAllMeals(
                              ScreenTitle: 'Top Search',
                              firstChar: 'b',
                            )));
              }),
          ItemsBox(
            bkg: const Color(0xffC3211A),
            futureList: CategorieData.GetCategorieTitle(),
            filterType: 'Categorie',
          ),
          AdsBox(revere: false),
          const MostWatchedBox(FirstChar: 'k'),
        ],
      ),
    );
  }
}
