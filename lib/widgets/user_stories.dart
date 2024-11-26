import 'package:flutter/material.dart';

Widget usersStories(String name, String image, [bool isUser = false]) {
  return Padding(
    padding: const EdgeInsets.only(right: 12),
    child: Column(
      children: [
        Stack(
          alignment: Alignment.bottomRight,
          children: [
            Container(
              width: 64, // Explicit size for CircleAvatar
              height: 64,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: isUser ? Colors.grey.shade200 : Color(0xFF6D60BC),
                  width: 3,
                ),
              ),
              child: CircleAvatar(
                radius: 30,
                backgroundImage: AssetImage(image),
              ),
            ),
            if (isUser)
              Positioned(
                bottom: 2,
                right: 2,
                child: CircleAvatar(
                  radius: 12,
                  backgroundColor: Color(0xFF6D60BC),
                  child: Icon(
                    Icons.add,
                    size: 16,
                    color: Colors.white,
                  ),
                ),
              ),
          ],
        ),
        SizedBox(height: 8),
        Text(
          name,
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w500,
          ),
          overflow: TextOverflow.ellipsis,
        ),
      ],
    ),
  );
}