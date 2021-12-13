import 'package:flutter/material.dart';
import 'package:movies/providers/movies_provider.dart';
import 'package:movies/widgets/widgets.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final moviesProvider = Provider.of<MoviesProvider>(context, listen: true);

    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('Movies'),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.search_outlined),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            // Main cards
            CardSwiper(movies: moviesProvider.nowPlayingMovies),

            // Movie Slider
            MovieSlider(
              movies: moviesProvider.popularMovies,
              title: 'Popular Movies!',
              onNextPage: () => moviesProvider.getPopularMovies(),
            ),
          ],
        ),
      ),
    );
  }
}
