import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong/latlong.dart';

class SettingScreen extends StatefulWidget {
  @override
  _SettingScreenState createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {

  Position _currentPosition;
  MapController mapController = MapController();

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
  }

  _getCurrentLocation() async {
    _currentPosition = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        elevation: 0,
      backgroundColor: Colors.grey[200],
        leading: Padding(
          padding: EdgeInsets.symmetric(horizontal: 25,vertical: 10),
          child: GestureDetector(
            onTap: () => Navigator.pop(context),
            child: FaIcon(FontAwesomeIcons.chevronDown,color: Colors.black)
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 25,vertical: 10),
            child: FaIcon(FontAwesomeIcons.cog,color: Colors.black,),
          )
        ]
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: 120,
                child: Image.asset("assets/snapcode.png"),
              ),
              Padding(padding: EdgeInsets.symmetric(vertical: 10)),
              Container(
                width: MediaQuery.of(context).size.width,
                child: Text("RitaBouz",textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20)),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("RitaBouzi56",textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 12)),
                    Padding(padding: EdgeInsets.symmetric(horizontal: 10)),
                    Text("21834",textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 12)),
                    Padding(padding: EdgeInsets.symmetric(horizontal: 10)),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 8,vertical: 6),
                      decoration: BoxDecoration(
                        color: Colors.deepPurple,
                        borderRadius: BorderRadius.circular(10)
                      ),
                      child: Row(
                        children: [
                          FaIcon(FontAwesomeIcons.balanceScale,color: Colors.white,size: 12),
                          Padding(padding: EdgeInsets.symmetric(horizontal: 2)),
                          FaIcon(FontAwesomeIcons.chevronRight,color: Colors.white,size: 8)
                        ],
                      ),
                    )
                  ]
                )
              ),
              Padding(padding: EdgeInsets.symmetric(vertical: 10)),
              Container(
                width: MediaQuery.of(context).size.width,
                child: Row(
                  children: [
                    Expanded(
                      flex: 4,
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Text("Stories",style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16))
                      )
                    ),
                    Expanded(
                      flex: 2,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 15),
                        child: Container(
                          height: 25,
                          decoration: BoxDecoration(
                            color: Colors.black12,
                            borderRadius: BorderRadius.circular(20)
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              FaIcon(FontAwesomeIcons.plus,size: 14,color: Colors.blue),
                              Padding(padding: EdgeInsets.symmetric(horizontal: 2)),
                              Text("New Story", style: TextStyle(fontWeight: FontWeight.bold,fontSize: 10))
                            ]
                          )
                        )
                      )
                    )
                  ]
                )
              ),
              Padding(padding: EdgeInsets.symmetric(vertical: 8)),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)
                  ),
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 15),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 9,
                          child: Container(
                            child: Row(
                              children: [
                                Padding(padding: EdgeInsets.symmetric(horizontal: 10)),
                                FaIcon(FontAwesomeIcons.cameraRetro,color: Colors.blue),
                                Padding(padding: EdgeInsets.symmetric(horizontal: 8)),
                                Text("Add to My Story",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),)
                              ]
                            )
                          )
                        ),
                        Expanded(
                          flex: 1,
                          child: Container(
                            child: FaIcon(FontAwesomeIcons.ellipsisV,color: Colors.grey,size: 20)
                          )
                        )
                      ]
                    )
                  )
                )
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)
                  ),
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 15),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 9,
                          child: Container(
                            child: Row(
                              children: [
                                Padding(padding: EdgeInsets.symmetric(horizontal: 10)),
                                FaIcon(FontAwesomeIcons.cameraRetro,color: Colors.blue),
                                Padding(padding: EdgeInsets.symmetric(horizontal: 8)),
                                Text("Add to Snap Map",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),)
                              ]
                            )
                          )
                        ),
                        Expanded(
                          flex: 1,
                          child: Container(
                            child: FaIcon(FontAwesomeIcons.ellipsisV,color: Colors.grey,size: 20)
                          )
                        )
                      ]
                    )
                  )
                )
              ),
              Padding(padding: EdgeInsets.symmetric(vertical: 10)),
              Container(
                width: MediaQuery.of(context).size.width,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Text("Spotlight",style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16))
                )
              ),
              Padding(padding: EdgeInsets.symmetric(vertical: 8)),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)
                  ),
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 15),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 9,
                          child: Container(
                            child: Row(
                              children: [
                                Padding(padding: EdgeInsets.symmetric(horizontal: 10)),
                                FaIcon(FontAwesomeIcons.heart,color: Colors.grey,size: 20),
                                Padding(padding: EdgeInsets.symmetric(horizontal: 8)),
                                Text("My Spotlight Favourites",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),)
                              ]
                            )
                          )
                        ),
                        Expanded(
                          flex: 1,
                          child: Container(
                            child: FaIcon(FontAwesomeIcons.chevronRight,color: Colors.grey[400],size: 20)
                          )
                        )
                      ]
                    )
                  )
                )
              ),
              Padding(padding: EdgeInsets.symmetric(vertical: 10)),
              Container(
                width: MediaQuery.of(context).size.width,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Text("Friends",style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16))
                )
              ),
              Padding(padding: EdgeInsets.symmetric(vertical: 8)),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)
                  ),
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 15),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 9,
                          child: Container(
                            child: Row(
                              children: [
                                Padding(padding: EdgeInsets.symmetric(horizontal: 10)),
                                FaIcon(FontAwesomeIcons.userPlus,color: Colors.grey,size: 20),
                                Padding(padding: EdgeInsets.symmetric(horizontal: 8)),
                                Text("Add Friends",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),)
                              ]
                            )
                          )
                        ),
                        Expanded(
                          flex: 1,
                          child: Container(
                            child: FaIcon(FontAwesomeIcons.chevronRight,color: Colors.grey[400],size: 20)
                          )
                        )
                      ]
                    )
                  )
                )
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)
                  ),
                  child: Column(
                    children: [
                      Container(
                        child: Image.asset("assets/bitmoji-friends.png"),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 15),
                        child: Row(
                          children: [
                            Expanded(
                              flex: 9,
                              child: Container(
                                child: Row(
                                  children: [
                                    Padding(padding: EdgeInsets.symmetric(horizontal: 10)),
                                    FaIcon(FontAwesomeIcons.users,color: Colors.grey,size: 20),
                                    Padding(padding: EdgeInsets.symmetric(horizontal: 8)),
                                    Text("My Friends",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),)
                                  ]
                                )
                              )
                            ),
                            Expanded(
                              flex: 1,
                              child: Container(
                                child: FaIcon(FontAwesomeIcons.chevronRight,color: Colors.grey[400],size: 20)
                              )
                            )
                          ]
                        )
                      )
                    ]
                  )
                )
              ),
              Padding(padding: EdgeInsets.symmetric(vertical: 10)),
              Container(
                width: MediaQuery.of(context).size.width,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Text("Bitmoji",style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16))
                )
              ),
              Padding(padding: EdgeInsets.symmetric(vertical: 8)),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)
                  ),
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 15),
                        child: Row(
                          children: [
                            Expanded(
                              flex: 9,
                              child: Container(
                                child: Row(
                                  children: [
                                    Padding(padding: EdgeInsets.symmetric(horizontal: 10)),
                                    FaIcon(FontAwesomeIcons.tshirt,color: Colors.grey,size: 20),
                                    Padding(padding: EdgeInsets.symmetric(horizontal: 8)),
                                    Text("Change My Outfit",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),)
                                  ]
                                )
                              )
                            ),
                            Expanded(
                              flex: 1,
                              child: Container(
                                child: FaIcon(FontAwesomeIcons.chevronRight,color: Colors.grey[400],size: 20)
                              )
                            )
                          ]
                        )
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 15),
                        child: Row(
                          children: [
                            Expanded(
                              flex: 9,
                              child: Container(
                                child: Row(
                                  children: [
                                    Padding(padding: EdgeInsets.symmetric(horizontal: 10)),
                                    FaIcon(FontAwesomeIcons.pen,color: Colors.grey,size: 20),
                                    Padding(padding: EdgeInsets.symmetric(horizontal: 8)),
                                    Text("Edit Your Bitmoji",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),)
                                  ]
                                )
                              )
                            ),
                            Expanded(
                              flex: 1,
                              child: Container(
                                child: FaIcon(FontAwesomeIcons.chevronRight,color: Colors.grey[400],size: 20)
                              )
                            )
                          ]
                        )
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 15),
                        child: Row(
                          children: [
                            Expanded(
                              flex: 9,
                              child: Container(
                                child: Row(
                                  children: [
                                    Padding(padding: EdgeInsets.symmetric(horizontal: 10)),
                                    FaIcon(FontAwesomeIcons.userCircle,color: Colors.grey,size: 20),
                                    Padding(padding: EdgeInsets.symmetric(horizontal: 8)),
                                    Text("Select Selfie",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),)
                                  ]
                                )
                              )
                            ),
                            Expanded(
                              flex: 1,
                              child: Container(
                                child: FaIcon(FontAwesomeIcons.chevronRight,color: Colors.grey[400],size: 20)
                              )
                            )
                          ]
                        )
                      )
                    ]
                  )
                )
              ),
              Padding(padding: EdgeInsets.symmetric(vertical: 10)),
              Container(
                width: MediaQuery.of(context).size.width,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Text("Snap Map",style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16))
                )
              ),
              Padding(padding: EdgeInsets.symmetric(vertical: 8)),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)
                  ),
                  child: Column(
                    children: [
                      Container(
                        height: 140,
                        child: FlutterMap(
                          options: MapOptions(
                            interactive: false,
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
                        )
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 15),
                        child: Row(
                          children: [
                            Expanded(
                              flex: 9,
                              child: Container(
                                child: Row(
                                  children: [
                                    Padding(padding: EdgeInsets.symmetric(horizontal: 10)),
                                    FaIcon(FontAwesomeIcons.mapMarkerAlt,color: Colors.grey,size: 20),
                                    Padding(padding: EdgeInsets.symmetric(horizontal: 8)),
                                    Column(
                                      children: [
                                        Text("Sharing Location",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15)),
                                        Text("with My Friends",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 11,color: Colors.black45))
                                      ]
                                    )
                                  ]
                                )
                              )
                            ),
                            Expanded(
                              flex: 1,
                              child: Container(
                                child: FaIcon(FontAwesomeIcons.chevronRight,color: Colors.grey[400],size: 20)
                              )
                            )
                          ]
                        )
                      )
                    ]
                  )
                )
              ),
              Padding(padding: EdgeInsets.symmetric(vertical: 10)),
              Container(
                height: 100,
                child: Column(
                  children: [
                    SizedBox(
                      width: 25,
                      height: 25,
                      child: Image.asset("assets/snapchat-logo-setting.png"),
                    ),
                    Padding(padding: EdgeInsets.symmetric(vertical: 5)),
                    Text("Joined Snapchat on 06 September 2015",style: TextStyle(color: Colors.grey)),
                  ],
                ),
              )
            ]
          )
        )
      )
    );
  }
}