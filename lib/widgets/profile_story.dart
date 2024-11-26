import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget profileStory(String image){
  return Padding(
    padding: EdgeInsets.only(right: 12),
    child: Column(
      children: [
        Stack(
          alignment: Alignment.bottomRight,
          children: [
            Container(
              width: 64,
              height: 64,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: Colors.grey.shade500,
                  width: 2,
                )
              ),
              child: CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage(image),
              ),
            )
          ],
        )
      ],
    ),
  );
}