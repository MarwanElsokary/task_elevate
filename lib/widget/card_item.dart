import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/GetData.dart';

class CardItem extends StatelessWidget {
  GetData item;

  CardItem({required this.item, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 322,
      margin: EdgeInsets.all(12),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(25)),
        border: Border.all(color: Colors.white),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(25),
                topRight: Radius.circular(25),
              ),
              child: Image.network(item.image ?? ""),
            ),
            SizedBox(height: 10),
            Text(
              item.title ?? "",
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
              textAlign: TextAlign.center,
              overflow: TextOverflow.clip,
              maxLines: 2,
            ),
            Spacer(),
            Row(
              children: [
                Expanded(
                  child: Text(
                    "By: ${item.price ?? ""}",
                    textAlign: TextAlign.left,
                    maxLines: 1,
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Spacer(),
                Expanded(
                  child: Text(
                    (item.price ?? 0) as String,
                    textAlign: TextAlign.end,
                    maxLines: 1,

                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}