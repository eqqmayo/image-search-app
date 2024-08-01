import "package:flutter/material.dart";
import "package:image_search_app/domain/model/image.dart" as model;

class DetailScreen extends StatelessWidget {
  final model.Image image;

  const DetailScreen({
    super.key,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Hero(
            tag: image.id,
            child: Image.network(image.imageUrl),
          ),
          const SizedBox(height: 20),
          Text(
            'User: ${image.user}',
            style: const TextStyle(
              fontSize: 20,
            ),
          ),
          Text(
            'Tags: ${image.tags}',
            style: const TextStyle(
              fontSize: 20,
            ),
          ),
        ],
      ),
    );
  }
}
