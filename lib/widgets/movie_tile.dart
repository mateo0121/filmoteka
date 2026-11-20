import 'package:flutter/material.dart';

import '../models/movie.dart';

class MovieTile extends StatelessWidget {
  const MovieTile({super.key, required this.movie, required this.onWatchedChanged});

  final Movie movie;
  final ValueChanged<bool?> onWatchedChanged;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          value: movie.watched,
          onChanged: (Value) => onWatchedChanged(Value ?? false),
        ),
        Expanded(
          child: ListTile(
            title: Text(movie.title),
            subtitle: Text(
              '${movie.type == MovieType.film ? 'Film' : 'Serija'} - ${movie.year} - ${movie.genre} - ${movie.rating}',
            ),
            trailing: Icon(
              movie.favorite ? Icons.favorite : Icons.favorite_border,
              color: movie.favorite ? Colors.red : null,
            ),
          ),
        ),
      ],
    );
  }
}