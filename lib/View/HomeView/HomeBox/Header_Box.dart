import 'package:flutter/material.dart';

class HeaderBox extends StatelessWidget {
  const HeaderBox({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.location_on_outlined,
                      size: 15,
                      color: Colors.grey.shade600,
                    ),
                    const SizedBox(width: 5),
                    Expanded(
                      child: Text(
                        '39 Angle Boulevard Mohamed V Et Boulevard Zerktouni Bab Al Gharb Oujda, Oujda 60000',
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: Colors.grey.shade600,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 5),
                Text(
                  'Hello Mohammed',
                  style: TextStyle(
                    color: Colors.grey.shade900,
                    fontSize: 24,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 20),
          InkWell(
            onTap: (() {
              print('Go To Profile');
            }),
            child: Container(
              height: 43,
              width: 43,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(7),
                  image: const DecorationImage(
                      image: AssetImage(
                        'assets/user.png',
                      ),
                      fit: BoxFit.cover),
                  boxShadow: const [
                    BoxShadow(
                      offset: Offset(2, 2),
                      blurRadius: 1,
                      color: Color.fromARGB(82, 0, 0, 0),
                    )
                  ]),
            ),
          )
        ],
      ),
    );
  }
}
