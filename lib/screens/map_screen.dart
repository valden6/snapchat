import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong/latlong.dart';
import 'package:geocoding/geocoding.dart';

class MapScreen extends StatefulWidget {
  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {

  String _currentCity;
  Position _currentPosition;
  MapController mapController = MapController();

  _getCurrentLocation() async {
    
    _currentPosition = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    await _getAddressFromLatLng();

    mapController.move(LatLng(_currentPosition.latitude,_currentPosition.longitude), 14);
  }

  _getAddressFromLatLng() async {
    try {
      List<Placemark> placemark = await placemarkFromCoordinates(_currentPosition.latitude,_currentPosition.longitude);
      Placemark place = placemark[0];

      setState(() {
        _currentCity = place.locality.toString();
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(15),bottomRight: Radius.circular(15))
        ),
        child: Stack(
          children: [
            FlutterMap(
              mapController: mapController,
              options: MapOptions(
                center: _currentPosition == null ? LatLng(40.74911596007762, -73.98552155151941) : LatLng(_currentPosition.latitude,_currentPosition.longitude),
                zoom: 13,
              ),
              layers: [
                TileLayerOptions(
                  urlTemplate: "https://api.mapbox.com/styles/v1/guoefje/cklv19l1f189z17lbvqo1d3c2/tiles/256/{z}/{x}/{y}@2x?access_token=pk.eyJ1IjoiZ3VvZWZqZSIsImEiOiJja2prMGszMjkxcXNxMzFudm1obnVyNTlsIn0.upAKCirk1CrgtMhMAZJoDA",
                  additionalOptions: {
                    'accessToken': 'pk.eyJ1IjoiZ3VvZWZqZSIsImEiOiJja2x2MmF3dncyNGNoMnVsd2l2NjQ5ZHRsIn0.rTtV6Zw8As73Wn16X09Nng',
                    'id': 'mapbox.mapbox-streets-v8'
                  }
                )
              ]
            ),
            Positioned(
              top: 50,
              child: Container(
                width: MediaQuery.of(context).size.width,
                child: Row(
                  children: <Widget>[
                    Expanded(
                      flex: 1,
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 5),
                        child: Row(
                          children: [
                            CircleAvatar(
                              backgroundColor: Colors.black26,
                              backgroundImage: AssetImage("assets/avatar.jpg"),
                            ),
                            Padding(padding: EdgeInsets.symmetric(horizontal: 2)),
                            CircleAvatar(
                              backgroundColor: Colors.black26,
                              child: FaIcon(FontAwesomeIcons.search,color: Colors.white, size: 20)
                            )
                          ]
                        )
                      )
                    ),
                    Expanded(
                      flex: 2,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.black26,
                          ),
                          child: Text(_currentCity==null ? "New York" : _currentCity,textAlign: TextAlign.center,style: TextStyle(color: Colors.white,fontWeight: FontWeight.w900,fontSize: 18))
                        ),
                      )
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 5),
                        alignment: Alignment.centerRight,
                        child: CircleAvatar(
                          backgroundColor: Colors.black26,
                          child: FaIcon(FontAwesomeIcons.cog,color: Colors.white, size: 20)
                        )
                      )
                    )
                  ]
                )
              )
            ),
            Positioned(
              bottom: 20,
              child: Container(
                width: MediaQuery.of(context).size.width,
                child: Row(
                  children: <Widget>[
                    Expanded(
                      flex: 1,
                      child: Container(
                        child: Column(
                          children: [
                            CircleAvatar(
                              radius: 30,
                              backgroundColor: Colors.black26,
                              backgroundImage: AssetImage("assets/avatar.jpg"),
                            ),
                            Padding(padding: EdgeInsets.symmetric(horizontal: 2)),
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 8,vertical: 2),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20)
                              ),
                              child: Text("My Bitmoji",style: TextStyle(fontWeight: FontWeight.bold))
                            )
                          ]
                        )
                      )
                    ),
                    Expanded(
                      flex: 1,
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            _getCurrentLocation();
                          });
                        },
                        child: Container(
                          child: CircleAvatar(
                            backgroundColor: Colors.white,
                            child: FaIcon(FontAwesomeIcons.locationArrow,size: 15,color: Colors.black,),
                          )
                        ),
                      )
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        child: Column(
                          children: [
                            CircleAvatar(
                              radius: 30,
                              backgroundColor: Colors.black26,
                              backgroundImage: AssetImage("assets/avatar-friends.jpg"),
                            ),
                            Padding(padding: EdgeInsets.symmetric(horizontal: 2)),
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 8,vertical: 2),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20)
                              ),
                              child: Text("Friends",style: TextStyle(fontWeight: FontWeight.bold))
                            )
                          ]
                        )
                      )
                    )
                  ]
                )
              )
            )
          ]
        )
      )
    );
  }
}