import 'package:image_search_app/domain/model/image.dart';

abstract interface class ImageRepository {
  Future<List<Image>> getImages(String keyword);
}
