import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:image_search_app/domain/model/image.dart';

part 'search_ui_state.freezed.dart';

@freezed
class SearchUiState with _$SearchUiState {
  const factory SearchUiState({
    @Default('') String keyword,
    @Default([]) List<Image> images,
    @Default(false) bool isLoading,
    @Default(0) int page,
  }) = _SearchUiState;
}
