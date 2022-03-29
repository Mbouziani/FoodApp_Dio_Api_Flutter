import 'package:flutter/material.dart';
import 'package:themealdbdemoapi/Controler/Categorie_Data.dart';
import 'package:themealdbdemoapi/Model/Categorie_Modal.dart';
import 'package:themealdbdemoapi/View/MealsByCategorie_Screen.dart';

class CategorieScreen extends StatelessWidget {
  const CategorieScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          iconTheme: const IconThemeData(color: Colors.black87),
          elevation: 0,
          titleSpacing: 0,
          title: const Text(
            'Categories',
            style:
                TextStyle(color: Colors.black87, fontWeight: FontWeight.bold),
          ),
        ),
        body: FutureBuilder<List<Categories>>(
          future: CategorieData.GetCategories(),
          builder: (context, snapshot) {
            return ListView.separated(
              physics: const BouncingScrollPhysics(),
              shrinkWrap: true,
              itemCount: snapshot.hasData ? snapshot.data!.length : 10,
              itemBuilder: (context, index) {
                return Container(
                  width: double.infinity,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  child: ListView(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Container(
                                height: 40,
                                width: 40,
                                decoration: BoxDecoration(
                                    color: snapshot.hasData
                                        ? Colors.white
                                        : Colors.grey.shade300,
                                    borderRadius: BorderRadius.circular(10),
                                    image: snapshot.hasData
                                        ? DecorationImage(
                                            image: NetworkImage(
                                              snapshot.data![index]
                                                  .strCategoryThumb!,
                                            ),
                                            fit: BoxFit.contain)
                                        : null,
                                    boxShadow: const [
                                      BoxShadow(
                                        offset: Offset(1.5, 1.5),
                                        blurRadius: 1,
                                        color: Color.fromARGB(90, 0, 0, 0),
                                      )
                                    ]),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              snapshot.hasData
                                  ? Text(
                                      snapshot.data![index].strCategory!,
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w800,
                                      ),
                                    )
                                  : Container(
                                      height: 15,
                                      width: 100,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(7),
                                        color: Colors.grey.shade300,
                                      ),
                                    ),
                            ],
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 5.0),
                            child: snapshot.hasData
                                ? TextButton(
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                MealsByCategotrieScreen(
                                              categoryname: snapshot
                                                  .data![index].strCategory!,
                                              filterType: 'Categorie',
                                            ),
                                          ));
                                    },
                                    child: const Text(
                                      'See Meals',
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        color: Color(0xffC3211A),
                                        fontSize: 16,
                                        fontWeight: FontWeight.w800,
                                      ),
                                    ))
                                : Container(
                                    height: 15,
                                    width: 70,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(7),
                                      color: Colors.grey.shade300,
                                    ),
                                  ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          child: snapshot.hasData
                              ? Text(
                                  snapshot.data![index].strCategoryDescription!,
                                  // maxLines: 15,
                                  style: const TextStyle(
                                    color: Colors.grey,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                  ))
                              : Column(
                                  children: List.generate(
                                    3,
                                    (index) => Padding(
                                      padding: const EdgeInsets.all(5.0),
                                      child: Container(
                                        height: 15,
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(7),
                                          color: Colors.grey.shade300,
                                        ),
                                      ),
                                    ),
                                  ),
                                )),
                    ],
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
            );
          },
        ));
  }
}
