import 'package:flutter/material.dart';
import 'package:image_search_app/domain/repository/image_repository.dart';
import 'package:image_search_app/presentation/search_screen/search_ui_state.dart';

class SearchViewModel with ChangeNotifier {
  final ImageRepository _imageRepository;

  SearchUiState _state = const SearchUiState();
  SearchUiState get state => _state;

  SearchViewModel(this._imageRepository);

  void searchImages(String keyword) {
    if (state.keyword != keyword) {
      _state = SearchUiState(keyword: keyword);
    }
    loadImages(keyword);
  }

  void loadImages(String keyword) async {
    _state = state.copyWith(
      isLoading: true,
      page: state.page + 1,
    );
    notifyListeners();

    final images = await _imageRepository.getImages(keyword, state.page);
    _state = state.copyWith(
      images: [...state.images, ...images],
      isLoading: false,
    );
    notifyListeners();
  }
}
