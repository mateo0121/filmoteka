import 'package:flutter/foundation.dart';
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
    'Drama',
    'Komedija',
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
          '${_titleController.text}, ${_yearController.text}, ${_type.name}, '
          '$_genre, ocjena ${_rating.round()}, pogledano: $_watched, '
          'favorit: $_favorite';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Novi film')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          TextField(
            controller: _titleController,
            decoration: const InputDecoration(
              labelText: 'Naslov',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 12),
          TextField(
            controller: _yearController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              labelText: 'Godina',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 12),
          RadioGroup<MovieType>(
            groupValue: _type,
            onChanged: (value) {
              if (value != null) {
                setState(() {
                  _type = value;
                });
              }
            },
            child: const Column(
              children: [
                RadioListTile(value: MovieType.film, title: Text('Film')),
                RadioListTile(value: MovieType.series, title: Text('Serija')),
              ],
            ),
          ),
          const SizedBox(height: 12),
          const Text('Žanr'),
          DropdownButton<String>(
            value: _genre,
            items: _genres
                .map(
                  (genre) => DropdownMenuItem(value: genre, child: Text(genre)),
                )
                .toList(),
            onChanged: (value) {
              setState(() {
                if (value != null) {
                  _genre = value;
                }
              });
            },
          ),
          const SizedBox(height: 12),
          Text('Ocjena: ${_rating.round()}'),
          Slider(
            value: _rating,
            min: 1,
            max: 10,
            divisions: 9,
            label: '${_rating.round()}',
            onChanged: (value) {
              setState(() {
                _rating = value;
              });
            },
          ),
          const SizedBox(height: 12),
          CheckboxListTile(
            title: const Text('Pogledano'),
            value: _watched,
            onChanged: (value) {
              setState(() {
                _watched = value ?? false;
              });
            },
          ),
          const SizedBox(height: 12),
          SwitchListTile(
            title: Text('Favorit'),
            value: _favorite,
            onChanged: (value) {
              setState(() {
                _favorite = value;
              });
            },
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              OutlinedButton.icon(
                onPressed: _clear,
                icon: const Icon(Icons.clear),
                label: const Text('Očistiti'),
              ),
              const SizedBox(width: 12),
              FilledButton(onPressed: _save, child: const Text('Spremi')),
            ],
          ),
          const SizedBox(height: 12),
          Text(_summary),
        ],
      ),
    );
  }
}
