import 'package:flutter/material.dart';
import 'package:great_places/providers/great_places_provider.dart';
import 'package:great_places/screens/add_place_screen.dart';
import 'package:provider/provider.dart';

class PlacesListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Places'),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.of(context).pushNamed(AddPlaceScreen.routeName);
            },
          ),
        ],
      ),
      body: Consumer<GreatPlaces>(
        child: Center(
          child: const Text('Got no places yet, start adding some!'),
        ),
        builder: (context, greatPlaces, child) {
          if (greatPlaces.items.length <= 0) {
            return child;
          }
          return ListView.builder(
            itemCount: greatPlaces.items.length,
            itemBuilder: (context, index) {
              final current = greatPlaces.items[index];
              return ListTile(
                leading: CircleAvatar(
                  backgroundImage: FileImage(current.image),
                ),
                title: Text(current.title),
                onTap: () {
                  //Go to detail page.
                },
              );
            },
          );
        },
      ),
    );
  }
}
