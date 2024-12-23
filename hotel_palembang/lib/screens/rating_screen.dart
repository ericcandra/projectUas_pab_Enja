import 'package:flutter/material.dart';

class RatingScreen extends StatelessWidget {
  const RatingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rating Hotel'),
      ),
      body: ListView.builder(
        itemCount: hotelList.length,
        itemBuilder: (context, index) {
          final hotel = hotelList[index];
          return ListTile(
            title: Text(hotel.name),
            subtitle: Text('Rating: ${hotel.rating}'),
            trailing: IconButton(
              icon: const Icon(Icons.star_rate),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => RatingDialog(hotel: hotel),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

class RatingDialog extends StatefulWidget {
  final Hotel hotel;

  const RatingDialog({required this.hotel});

  @override
  _RatingDialogState createState() => _RatingDialogState();
}

class _RatingDialogState extends State<RatingDialog> {
  double _rating = 0;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Rate ${widget.hotel.name}'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('Current Rating: ${widget.hotel.rating}'),
          Slider(
            value: _rating,
            onChanged: (newRating) {
              setState(() {
                _rating = newRating;
              });
            },
            divisions: 5,
            label: '$_rating',
            min: 0,
            max: 5,
          ),
        ],
      ),
      actions: [
        TextButton(
          child: const Text('Cancel'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        TextButton(
          child: const Text('Submit'),
          onPressed: () {
            setState(() {
              widget.hotel.rating = _rating;
            });
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}

class Hotel {
  final String name;
  double rating;
  
  Hotel({required this.name, this.rating = 0});
}

final List<Hotel> hotelList = [
  Hotel(name: 'Hotel Airish', rating: 3.5),
  Hotel(name: 'Hotel Algoritma', rating: 4.0),
  Hotel(name: 'Hotel the ALTS', rating: 2.5),
];