import 'package:flutter/material.dart';
import 'movie_form_screen.dart';
import '../models/movie.dart';
import '../widgets/movie_tile.dart';

class MovieListScreen extends StatefulWidget {
  const MovieListScreen({super.key});

  @override
  State<MovieListScreen> createState() => _MovieListScreenState();
}

class _MovieListScreenState extends State<MovieListScreen> {
  // final _titles = ['Intererstellar', 'Shrek', 'Breaking bad'];
  final List<Movie> _movies = [
    Movie(
      id: 1,
      title: 'Interstellar',
      year: 2014,
      genre: 'Sci-Fi',
      rating: 8.6,
      type: MovieType.film,
      watched: false,
      favorite: false,
    ),
    Movie(
      id: 2,
      title: 'Shrek',
      year: 2001,
      genre: 'Animirani',
      rating: 8.0,
      type: MovieType.film,
      watched: true,
      favorite: true,
    ),
    Movie(
      id: 3,
      title: 'Breaking bad',
      year: 2014,
      genre: 'Drama',
      rating: 10,
      type: MovieType.series,
      watched: false,
      favorite: false,
    ),
  ];
  String _query = '';

  void _openForm() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const MovieFormScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    final found = _titles
        .where((title) => title.toLowerCase().contains(_query.toLowerCase()))
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Filmoteka'),
        actions: [
          IconButton(
            onPressed: _openForm,
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: TextField(
              decoration: const InputDecoration(
                labelText: 'Traži',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                setState(() {
                  _query = value;
                });
              },
            ),
          ),
          Text(
            'Pronađeno: ${found.length}',          ),
          Expanded(
            child: ListView.builder(
              itemCount: found.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(found[index]),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}