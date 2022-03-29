import 'package:flutter/material.dart';
import 'package:themealdbdemoapi/Controler/Area_Data.dart';

import '../../MealsByCategorie_Screen.dart';

class ItemsBox extends StatelessWidget {
  const ItemsBox({
    Key? key,
    required this.bkg,
    required this.futureList,
    required this.filterType,
  }) : super(key: key);
  final String filterType;
  final Color bkg;
  final Future<List<String>> futureList;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<String>>(
      future: futureList,
      builder: (context, snapshot) {
        return ItemShape(
          filterType: filterType,
          bkg: bkg,
          AreaList: snapshot.hasData ? snapshot.data! : [],
        );
      },
    );
  }
}

class ItemShapeSchema extends StatelessWidget {
  const ItemShapeSchema({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class ItemShape extends StatelessWidget {
  const ItemShape({
    Key? key,
    required this.bkg,
    required this.AreaList,
    required this.filterType,
  }) : super(key: key);
  final Color bkg;
  final List<String> AreaList;
  final String filterType;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        top: 5,
      ),
      width: double.infinity,
      height: 43,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: AreaList.isNotEmpty ? AreaList.length : 15,
        itemBuilder: (context, index) {
          return AreaList.isNotEmpty
              ? GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MealsByCategotrieScreen(
                            categoryname: AreaList[index].toString(),
                            filterType: filterType,
                          ),
                        ));
                  },
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                    margin: const EdgeInsets.only(left: 10, top: 5, bottom: 5),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      color: bkg,
                    ),
                    child: Text(
                      AreaList[index].toString(),
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                )
              : Container(
                  height: 15,
                  width: 80,
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                  margin: const EdgeInsets.only(left: 15, top: 5, bottom: 5),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                    color: Colors.grey.shade300,
                  ),
                );
        },
      ),
    );
  }
}
