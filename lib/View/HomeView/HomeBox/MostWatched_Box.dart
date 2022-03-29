import 'package:flutter/material.dart';
import 'package:share/share.dart';
import 'package:themealdbdemoapi/Controler/Meal_Data.dart';
import 'package:themealdbdemoapi/Model/Meal_Model.dart';
import 'package:themealdbdemoapi/View/MealDetails_Screen.dart';
import 'package:url_launcher/url_launcher.dart';

class MostWatchedBox extends StatelessWidget {
  const MostWatchedBox({
    Key? key,
    required this.FirstChar,
  }) : super(key: key);
  final String FirstChar;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<MealModel>>(
      future: MealData.GetMealByFirstChar(FirstChar),
      builder: (context, snapshot) {
        return SizedBox(
          width: double.infinity,
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
                        ? const Text(
                            'Most Watched',
                            style: TextStyle(
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
                            onPressed: () {},
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
              SizedBox(
                width: double.infinity,
                child: ListView.separated(
                  itemCount: !snapshot.hasData
                      ? 5
                      : snapshot.data!.length > 15
                          ? 15
                          : snapshot.data!.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
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
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        height: 120,
                        width: double.infinity,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: () async {
                                final String url =
                                    snapshot.data![0].strYoutube!;

                                await launch(
                                  url,
                                  forceSafariVC:
                                      false, // false : lunching your url in another Browser of iOS
                                  forceWebView:
                                      false, //  false :lunching your url in another Browser of Android
                                  enableJavaScript: true, // Android
                                );
                              },
                              child: Container(
                                width: 105,
                                height: 100,
                                decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.only(
                                      topLeft: Radius.zero,
                                      bottomLeft: Radius.zero,
                                      topRight: Radius.circular(10),
                                      bottomRight: Radius.circular(10),
                                    ),
                                    color: snapshot.hasData
                                        ? Colors.white
                                        : Colors.grey.shade300,
                                    image: snapshot.hasData
                                        ? DecorationImage(
                                            image: NetworkImage(
                                              snapshot
                                                  .data![index].strMealThumb!,
                                            ),
                                            fit: BoxFit.cover)
                                        : null,
                                    boxShadow: const [
                                      BoxShadow(
                                        offset: Offset(2, 2),
                                        blurRadius: 5,
                                        color: Color.fromARGB(59, 0, 0, 0),
                                      )
                                    ]),
                                child: const Icon(
                                  Icons.play_circle_outline_rounded,
                                  size: 50,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Expanded(
                                child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                snapshot.hasData
                                    ? Text(
                                        snapshot.data![index].strMeal!,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: const TextStyle(
                                          color: Colors.black,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w800,
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
                                const SizedBox(
                                  height: 3,
                                ),
                                Row(
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
                                  height: 5,
                                ),
                                snapshot.hasData
                                    ? Text(
                                        snapshot.data![index].strInstructions!,
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        style: const TextStyle(
                                          color: Colors.grey,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      )
                                    : Expanded(
                                        child: Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(7),
                                            color: Colors.grey.shade300,
                                          ),
                                        ),
                                      ),
                              ],
                            )),
                            const SizedBox(
                              width: 10,
                            ),
                            Container(
                              width: 1,
                              height: 65,
                              color: Colors.grey.shade300,
                            ),
                            Padding(
                              padding: EdgeInsets.all(15.0),
                              child: snapshot.hasData
                                  ? GestureDetector(
                                      onTap: () {
                                        print('share');
                                        Share.share(
                                          'Look How to Cook this ${snapshot.data![index].strMeal} ? check it Now ${snapshot.data![index].strYoutube}',
                                        );
                                      },
                                      child: const Icon(
                                        Icons.share_rounded,
                                        size: 25,
                                        color: Colors.black,
                                      ),
                                    )
                                  : Icon(
                                      Icons.fiber_manual_record_rounded,
                                      size: 25,
                                      color: Colors.grey.shade400,
                                    ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 50),
                      child: Container(
                        width: double.infinity,
                        height: 1,
                        color: Colors.grey.shade200,
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
