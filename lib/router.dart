import 'package:go_router/go_router.dart';
import 'package:image_search_app/data/data_source/image_data_source.dart';
import 'package:image_search_app/domain/model/image.dart';
import 'package:image_search_app/presentation/detail_screen/detail_screen.dart';
import 'package:image_search_app/presentation/search_screen/search_screen.dart';
import 'package:image_search_app/presentation/search_screen/search_view_model.dart';
import 'package:image_search_app/data/repository/image_repository_impl.dart';
import 'package:provider/provider.dart';

final router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => ChangeNotifierProvider(
        create: (context) => SearchViewModel(
          ImageRepositoryImpl(
            ImageDataSource(),
          ),
        ),
        child: const SearchScreen(),
      ),
    ),
    GoRoute(
        path: '/detail_screen',
        builder: (context, state) {
          final image = state.extra as Image;

          return ChangeNotifierProvider(
            create: (context) => SearchViewModel(
              ImageRepositoryImpl(
                ImageDataSource(),
              ),
            ),
            child: DetailScreen(image: image),
          );
        }),
  ],
);
