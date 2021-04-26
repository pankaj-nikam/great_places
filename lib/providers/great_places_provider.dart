import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:great_places/helpers/db_helper.dart';

import '../models/place.dart';

class GreatPlaces with ChangeNotifier {
  List<Place> _items = [];

  List<Place> get items {
    return [..._items];
  }

  Future<void> addPlace(String pickedTitle, File pickedImage) async {
    final newPlace = Place(
      id: DateTime.now().toString(),
      title: pickedTitle,
      location: null,
      image: pickedImage,
    );
    _items.add(newPlace);
    notifyListeners();
    await DBHelper.insert(
      'user_places',
      {
        'id': newPlace.id,
        'title': newPlace.title,
        'image': newPlace.image.path,
      },
    );
  }

  Future<void> fetchAndSetPlaces() async {
    final places = await DBHelper.getData('user_places');
    _items = places
        .map(
          (e) => Place(
            id: e['id'],
            title: e['title'],
            location: null,
            image: File(e['image']),
          ),
        )
        .toList();
    notifyListeners();
  }
}
