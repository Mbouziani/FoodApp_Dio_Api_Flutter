import 'package:flutter/material.dart';
import 'package:themealdbdemoapi/Controler/Meal_Data.dart';
import 'package:themealdbdemoapi/Model/Meal_Model.dart';
import 'package:themealdbdemoapi/View/MealDetails_Screen.dart';

class SeeAllMeals extends StatelessWidget {
  const SeeAllMeals(
      {Key? key, required this.ScreenTitle, required this.firstChar})
      : super(key: key);
  final String ScreenTitle;
  final String firstChar;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black87),
        titleSpacing: 0,
        elevation: 3,
        title: Text(
          ScreenTitle,
          style: const TextStyle(
              color: Colors.black87, fontWeight: FontWeight.bold),
        ),
      ),
      body: FutureBuilder<List<MealModel>>(
        future: MealData.GetMealByFirstChar('c'),
        builder: (context, snapshot) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ),
                itemCount: snapshot.hasData ? snapshot.data!.length : 33,
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
                      margin: const EdgeInsets.all(10),
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
                }),
          );
        },
      ),
    );
  }
}
