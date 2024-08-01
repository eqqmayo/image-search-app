import 'package:image_search_app/data_source/image_data_source.dart';
import 'package:image_search_app/mapper/image_mapper.dart';
import 'package:image_search_app/model/image.dart';

abstract interface class ImageRepository {
  Future<List<Image>> getImages(String keyword);
}

class ImageRepositoryImpl implements ImageRepository {
  final ImageDataSource _imageDataSource;

  ImageRepositoryImpl(this._imageDataSource);

  @override
  Future<List<Image>> getImages(String keyword) async {
    final imageDto = await _imageDataSource.getImages(keyword);
    return imageDto.map((dto) => dto.toImage()).toList();
  }
}
