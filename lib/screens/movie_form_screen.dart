import 'package:flutter/material.dart';

import '../models/movie.dart';

class MovieFormScreen extends StatefulWidget {
  const MovieFormScreen({super.key});

  @override
  State<MovieFormScreen> createState() => _MovieFormScreenState();
}

class _MovieFormScreenState extends State<MovieFormScreen> {
  final _titleController = TextEditingController();
  final _yearController = TextEditingController();

  final _genres = [
    'Akcija',
    'Animirani',
    'Komedija',
    'Drama',
    'Znanstvena fantastika',
  ];

  MovieType _type = MovieType.film;
  String _genre = 'Drama';
  double _rating = 5;
  bool _watched = false;
  bool _favorite = false;

  String _summary = '';

  @override
  void dispose() {
    _titleController.dispose();
    _yearController.dispose();
    super.dispose();
  }

  void _clear() {
    _titleController.clear();
    _yearController.clear();
  }

  void _save() {
    setState(() {
      _summary =
          'Title: ${_titleController.text}\n'
          'Year: ${_yearController.text}\n'
          'Type: ${_type.name}\n'
          'Genre: $_genre\n'
          'Rating: ${_rating.round()}\n'
          'Watched: $_watched\n'
          'Favorite: $_favorite';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Movie'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          TextField(
            controller: _titleController,
            decoration: const InputDecoration(
              labelText: 'Title',
            ),
          ),
          const SizedBox(height: 12),
          TextField(
            controller: _yearController,
            decoration: const InputDecoration(
              labelText: 'Year',
            ),
            keyboardType: TextInputType.number,
          ),
        ],
      ),
    );
  }
}
