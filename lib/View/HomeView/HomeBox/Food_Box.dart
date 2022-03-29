import 'dart:math';

import 'package:flutter/material.dart';
import 'package:themealdbdemoapi/Controler/Meal_Data.dart';
import 'package:themealdbdemoapi/Model/Meal_Model.dart';
import 'package:themealdbdemoapi/View/MealDetails_Screen.dart';

class FoodBox extends StatelessWidget {
  FoodBox({
    Key? key,
    required this.FirstChar,
    required this.BoxTitle,
    required this.onPressed,
  }) : super(key: key);
  final String FirstChar;
  final String BoxTitle;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<MealModel>>(
      future: MealData.GetMealByFirstChar(FirstChar),
      builder: (context, snapshot) {
        return SizedBox(
          width: double.infinity,
          height: 270,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    snapshot.hasData
                        ? Text(
                            BoxTitle,
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.w900,
                            ),
                          )
                        : Container(
                            height: 15,
                            width: 80,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(7),
                              color: Colors.grey.shade300,
                            ),
                          ),
                    snapshot.hasData
                        ? TextButton(
                            onPressed: onPressed,
                            child: const Text(
                              'See All',
                              style: TextStyle(
                                color: Color(0xffC3211A),
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          )
                        : Container(
                            height: 15,
                            width: 80,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(7),
                              color: Colors.grey.shade300,
                            ),
                          ),
                  ],
                ),
              ),
              Expanded(
                  child: ListView.builder(
                itemCount: !snapshot.hasData
                    ? 10
                    : snapshot.data!.length > 15
                        ? 15
                        : snapshot.data!.length,
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MealDetailsScreen(
                                  MealID: snapshot.data![index].idMeal
                                      .toString())));
                    },
                    child: Container(
                      margin:
                          const EdgeInsets.only(left: 15, top: 5, bottom: 20),
                      width: 160,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                          boxShadow: const [
                            BoxShadow(
                              offset: Offset(0, 2),
                              blurRadius: 5,
                              color: Color.fromARGB(76, 0, 0, 0),
                            )
                          ]),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Container(
                              margin: const EdgeInsets.all(3),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(7),
                                color: Colors.grey.shade300,
                                image: snapshot.hasData
                                    ? DecorationImage(
                                        image: NetworkImage(
                                          snapshot.data![index].strMealThumb!,
                                        ),
                                        fit: BoxFit.cover)
                                    : null,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 8),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                snapshot.hasData
                                    ? Text(
                                        snapshot.data![index].strMeal!,
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        style: const TextStyle(
                                          color: Colors.black,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w800,
                                        ),
                                      )
                                    : Container(
                                        height: 15,
                                        width: 130,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(7),
                                          color: Colors.grey.shade300,
                                        ),
                                      ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    snapshot.hasData
                                        ? Text(
                                            snapshot.data![index].strCategory! +
                                                ' - ' +
                                                snapshot.data![index].strArea!,
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                              color: Colors.grey.shade500,
                                              fontSize: 14,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          )
                                        : Container(
                                            height: 15,
                                            width: 80,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(7),
                                              color: Colors.grey.shade300,
                                            ),
                                          ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 3,
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                },
              ))
            ],
          ),
        );
      },
    );
  }
}
