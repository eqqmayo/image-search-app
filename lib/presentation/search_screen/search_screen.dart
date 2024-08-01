import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:image_search_app/presentation/component/custom_search_bar.dart';
import 'package:image_search_app/presentation/search_screen/search_view_model.dart';
import 'package:provider/provider.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final _scrollController = ScrollController();
  final _textEditingController = TextEditingController();

  @override
  void initState() {
    _scrollController.addListener(_onScroll);
    super.initState();
  }

  void _onScroll() {
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      context.read<SearchViewModel>().loadImages(_textEditingController.text);
    }
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<SearchViewModel>();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(kToolbarHeight),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: CustomSearchBar(
              textEditingController: _textEditingController,
              onSearch: (keyword) {
                viewModel.searchImages(keyword);
              },
            ),
          ),
        ),
      ),
      body: Stack(
        children: [
          GridView(
              controller: _scrollController,
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              children: viewModel.state.images
                  .map(
                    (image) => Hero(
                      tag: image.id,
                      child: GestureDetector(
                        onTap: () {
                          context.push('/detail_screen', extra: image);
                        },
                        child: Image.network(image.imageUrl),
                      ),
                    ),
                  )
                  .toList()),
          if (viewModel.state.isLoading)
            const Center(child: CircularProgressIndicator()),
        ],
      ),
    );
  }
}
