import 'package:flutter/material.dart';
import 'package:image_search_app/presentation/search_screen/search_ui_state.dart';
import 'package:image_search_app/repository/image_repository.dart';

class SearchViewModel with ChangeNotifier {
  final ImageRepository _imageRepository;

  SearchUiState _state = const SearchUiState();
  SearchUiState get state => _state;

  SearchViewModel(this._imageRepository);

  void searchImages(String keyword) async {
    _state = state.copyWith(isLoading: true);
    notifyListeners();

    final images = await _imageRepository.getImages(keyword);
    _state = state.copyWith(
      images: images,
      isLoading: false,
    );
    notifyListeners();
  }
}
