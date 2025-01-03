import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RatingScreen extends StatefulWidget {
  const RatingScreen({super.key});

  @override
  State<RatingScreen> createState() => _RatingScreenState();
}

class _RatingScreenState extends State<RatingScreen> {
  Map<String, double> ratings = {};

  Future<void> _loadRatings() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    Set<String> keys = prefs.getKeys();

    Map<String, double> loadedRatings = {};
    for (String key in keys) {
      if (key.startsWith('rating_')) {
        double? value = prefs.getDouble(key);
        if (value != null) {
          loadedRatings[key.replaceFirst('rating_', '')] = value;
        }
      }
    }

    setState(() {
      ratings = loadedRatings;
    });
  }

  @override
  void initState() {
    super.initState();
    _loadRatings();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ratings'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ratings.isEmpty
            ? const Center(
                child: Text('No ratings available'),
              )
            : ListView.builder(
                itemCount: ratings.length,
                itemBuilder: (context, index) {
                  String key = ratings.keys.elementAt(index);
                  double value = ratings[key]!;

                  return Card(
                    elevation: 5,
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    child: ListTile(
                      title: Text(key),
                      trailing: Text(value.toStringAsFixed(1)),
                    ),
                  );
                },
              ),
      ),
    );
  }
}
