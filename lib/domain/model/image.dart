import 'package:freezed_annotation/freezed_annotation.dart';

part 'image.freezed.dart';

@freezed
class Image with _$Image {
  const factory Image({
    required int id,
    required String user,
    required String tags,
    required String imageUrl,
  }) = _Image;
}
