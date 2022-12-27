import 'package:flutter/material.dart';

class UserProfileImage extends StatelessWidget {
  final String imageUrl;
  final double size;

  const UserProfileImage({
    super.key,
    required this.imageUrl,
    this.size = 40.0,
  });

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundImage: NetworkImage(imageUrl),
      radius: size,
    );
  }
}
