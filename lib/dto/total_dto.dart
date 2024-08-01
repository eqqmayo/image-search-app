import 'image_dto.dart';

class TotalDto {
  int? total;
  int? totalHits;
  List<ImageDto>? hits;

  TotalDto({this.total, this.totalHits, this.hits});

  factory TotalDto.fromJson(Map<String, dynamic> json) => TotalDto(
        total: json['total'] as int?,
        totalHits: json['totalHits'] as int?,
        hits: (json['hits'] as List<dynamic>?)
            ?.map((e) => ImageDto.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'total': total,
        'totalHits': totalHits,
        'hits': hits?.map((e) => e.toJson()).toList(),
      };
}
