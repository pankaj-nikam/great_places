import 'package:flutter/foundation.dart';

const MAP_QUEST_API_KEY = 'kGBNCI13mhdn1G4TjYUOESVR3Ks2es9C';

class LocationHelper {
  static String generateLocationPreviewImage({
    @required double latitude,
    @required double longitude,
  }) {
    return 'https://www.mapquestapi.com/staticmap/v4/getmap?key=kGBNCI13mhdn1G4TjYUOESVR3Ks2es9C&center=$latitude,$longitude&imagetype=jpeg&size=600,300&zoom=17&pois=poi-1,$latitude,$longitude,0,0';
  }
}
