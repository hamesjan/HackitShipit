import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';

class MapPage extends StatefulWidget {
  @override
  MapPageState createState() => MapPageState();
}

class MapPageState extends State<MapPage> {
  Completer<GoogleMapController> _controller = Completer();
  Map<PolylineId, Polyline> _mapPolylines = {};
  int _polylineIdCounter = 1;

  double zoomVal=5.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          buildMap(context),
          ZoomIn(),
          ZoomOut(),
          _buildContainer(),
        ],
      ),
    );
  }

  Widget ZoomIn() {
    return Align(
      alignment: Alignment.topLeft,
      child: IconButton(
          icon: Icon(Icons.zoom_out,color:Color(0xff6200ee)),
          onPressed: () {
            zoomVal--;
            _minus( zoomVal);
          }),
    );
  }
  Widget ZoomOut() {
    return Align(
      alignment: Alignment.topRight,
      child: IconButton(
          icon: Icon(Icons.zoom_in,color:Color(0xff6200ee)),
          onPressed: () {
            zoomVal++;
            _plus(zoomVal);
          }),
    );
  }

  Future<void> _minus(double zoomVal) async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(target: LatLng(33.8358, -118.3406), zoom: zoomVal)));
  }
  Future<void> _plus(double zoomVal) async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(target: LatLng(33.8358, -118.3406), zoom: zoomVal)));
  }


  Widget _buildContainer() {
    return Align(
      alignment: Alignment.bottomLeft,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 20.0),
        height: 150.0,
        child:
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: _boxes(
                  "https://www.traderjoes.com/Brandify/images/121-Torrance-Hawthorne-Blvd-storefront.jpg",
                  33.8393, -118.3627,"On the Way!", "Estimated Arrival: 7 minutes"),
            ),
      ),
    );
  }

  Widget _boxes(String _image, double lat,double long,String restaurantName, String EWT) {
    return  GestureDetector(
      onTap: () {
        GoLocation(lat,long);
      },
      child:Container(
        child: new FittedBox(
          child: Material(
              color: Colors.white,
              elevation: 14.0,
              borderRadius: BorderRadius.circular(24.0),
              shadowColor: Color(0x802196F3),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    width: 180,
                    height: 200,
                    child: ClipRRect(
                      borderRadius: new BorderRadius.circular(24.0),
                      child: Image(
                        fit: BoxFit.fill,
                        image: AssetImage(
                          'assets/images/location.png'
                        ),
                      ),
                    ),),
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: myDetailsContainer1(restaurantName, EWT),
                    ),
                  ),

                ],)
          ),
        ),
      ),
    );
  }

  Widget myDetailsContainer1(String restaurantName, String EWT) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(left: 8.0),
          child: Container(
              child: Text(restaurantName,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold),
              )),
        ),
        Padding(
          padding: EdgeInsets.all(8),
          child: Text(
            EWT, style: TextStyle(
              fontSize: 22,
              color: Colors.black
          ),
          ),
        ),
        SizedBox(height:5.0),
      ],
    );
  }

  List<LatLng> _createPoints() {
    final List<LatLng> points = <LatLng>[];
    points.add(LatLng(33.85226, -118.353));
    points.add(LatLng(33.8393, -118.3627));
    points.add(LatLng(33.83722, -118.329367));
    points.add(LatLng(33.8065, -118.33337));
    return points;
  }

  void _add() {
    final String polylineIdVal = 'polyline_id_$_polylineIdCounter';
    _polylineIdCounter++;
    final PolylineId polylineId = PolylineId(polylineIdVal);

    final Polyline polyline = Polyline(
      polylineId: polylineId,
      consumeTapEvents: true,
      color: Colors.red,
      width: 5,
      points: _createPoints(),
    );

    setState(() {
      _mapPolylines[polylineId] = polyline;
    });
  }

  Widget buildMap(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition:  CameraPosition(target: LatLng(33.8358, -118.3406), zoom: 12),
        polylines: Set<Polyline>.of(_mapPolylines.values),

        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
          _add();
        },
        markers: {
          traderJoes,costco,cvs
        },
      ),
    );
  }

  Future<void> GoLocation(double lat,double long) async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(target: LatLng(lat, long), zoom: 15,tilt: 50.0,
      bearing: 45.0,)));
  }
}

Marker traderJoes = Marker(
  markerId: MarkerId('TraderJoes'),
  position: LatLng(33.85226, -118.353),
  infoWindow: InfoWindow(title: 'Trader Joes'),
  icon: BitmapDescriptor.defaultMarkerWithHue(
    BitmapDescriptor.hueBlue,
  ),
);

Marker costco = Marker(
  markerId: MarkerId('Costco'),
  position:
  LatLng(33.8065, -118.33337),
  infoWindow: InfoWindow(title: 'Costco'),
  icon: BitmapDescriptor.defaultMarker,
);

Marker cvs = Marker(
  markerId: MarkerId('CVS'),
  position: LatLng(33.8393, -118.3627),
  infoWindow: InfoWindow(title: 'CVS Pharmacy'),
  icon: BitmapDescriptor.defaultMarkerWithHue(
    BitmapDescriptor.hueBlue,
  ),
);

//New York Marker


