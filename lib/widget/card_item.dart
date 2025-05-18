import 'package:flutter/material.dart';
import '../models/GetData.dart';

class CardItem extends StatelessWidget {
  final GetData item;

  const CardItem({required this.item, super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,

      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: Colors.blueGrey, width: 2),
      ),
      color: Colors.transparent,

      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Stack(
              children: [
                Center(
                  child: Image.network(
                    item.image ?? '',
                    height: 120,
                    fit: BoxFit.fill,
                    errorBuilder:
                        (context, error, stackTrace) =>
                            const Icon(Icons.error, size: 60),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(6),
                  child: Align(
                    child: ImageIcon(
                      AssetImage("assets/images/icon_fav.png"),
                      color: Colors.indigo,
                    ),
                    alignment: Alignment.topRight,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),

            Text(
              item.title ?? 'No title',
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.blueGrey,
              ),
            ),
            const SizedBox(height: 4),

            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      'EGP ${item.price?.toStringAsFixed(0) ?? '0'}',
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.green,
                      ),
                    ),
                    SizedBox(width: 4),
                    Text(
                      '${((item.price ?? 0) + 200).toStringAsFixed(0)} EGP',
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Colors.blueGrey,
                        inherit: true,
                        decoration: TextDecoration.lineThrough,
                        decorationColor: Colors.blueGrey,
                        decorationThickness: 2,
                      ),
                    ),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(width: 4),
                    Text(
                      'Review (${item.rating?.rate?.toStringAsFixed(1) ?? '0.0'})',
                      style: const TextStyle(fontSize: 12),
                    ),
                    const Icon(Icons.star, color: Colors.amber, size: 16),
                    Spacer(),
                    ImageIcon(
                      AssetImage("assets/images/icon_add.png"),
                      color: Colors.indigo,
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
