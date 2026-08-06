import 'package:flutter/material.dart';
import '../constants.dart';
import '../models/media_item.dart';

class ThumbnailBadge extends StatelessWidget {
  const ThumbnailBadge({
    required this.mediaList,
    required this.constantUrl,
    required this.badgeType,
    super.key,
  });

  final MediaItem mediaList;
  final Constants constantUrl;
  final String badgeType;

  @override
  Widget build(BuildContext build) {
    return switch (badgeType) {
      'tv' => Container(
        color: Colors.red,
        child: Padding(
          padding: EdgeInsets.all(3),
          child: Text(
            "New Episode",
            style: TextStyle(color: Colors.white, fontSize: 6),
          ),
        ),
      ),
      'recent' => Container(
        color: const Color.fromARGB(255, 82, 54, 244),
        child: Padding(
          padding: EdgeInsets.all(3),
          child: Text(
            "Recently Added",
            style: TextStyle(color: Colors.white, fontSize: 6),
          ),
        ),
      ),
      'both' => Row(
        children: [
          Container(
            color: Colors.red,
            child: Padding(
              padding: EdgeInsets.all(3),
              child: Text(
                "New Episode",
                style: TextStyle(color: Colors.white, fontSize: 6),
              ),
            ),
          ),
          Container(
            color: const Color.fromARGB(255, 82, 54, 244),
            child: Padding(
              padding: EdgeInsets.all(3),
              child: Text(
                "Recently Added",
                style: TextStyle(color: Colors.white, fontSize: 6),
              ),
            ),
          ),
        ],
      ),

      _ => SizedBox(height: 0, width: 0),
    };
  }
}
