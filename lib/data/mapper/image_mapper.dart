import 'package:image_search_app/data/dto/image_dto.dart';
import 'package:image_search_app/domain/model/image.dart';

extension ImageMapper on ImageDto {
  Image toImage() {
    return Image(
        id: id ?? 0,
        user: user ?? 'none',
        tags: tags ?? 'none',
        imageUrl: largeImageUrl ?? 'none');
  }
}
