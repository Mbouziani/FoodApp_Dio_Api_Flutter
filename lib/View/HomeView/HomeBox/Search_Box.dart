import 'package:flutter/material.dart';

class SearchBox extends StatelessWidget {
  const SearchBox({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 40,
      alignment: Alignment.center,
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.grey.shade100,
          boxShadow: const [
            BoxShadow(
              offset: Offset(2, 2),
              blurRadius: 2,
              color: Color.fromARGB(50, 0, 0, 0),
            )
          ]),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisSize: MainAxisSize.min,
        children: const [
          Icon(
            Icons.search,
            color: Colors.grey,
            size: 18,
          ),
          SizedBox(
            width: 5,
          ),
          Text(
            'Search',
            style: TextStyle(
              color: Colors.grey,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
