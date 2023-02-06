import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:intl/intl.dart';
import 'package:weatherapp/weatherData.dart';
import 'package:weatherapp/getLocation.dart';
import 'package:geolocator/geolocator.dart';


var dayInfo = DateTime.now();
var dateFormat = DateFormat('EEEE, d MMM, yyyy').format(dayInfo);

class MyHomePage extends StatelessWidget {
  var client = WeatherData();
  var data;

  info() async {
    // var position = _determinePosition();
    //print('position is $position.latitude');
    Position _currentPosition = await GetPosition();
    data = await client.getData(_currentPosition.latitude, _currentPosition.longitude);
    return data;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: FutureBuilder(
      future: info(),
      builder: (context, snapshot) => Container(
          child: Column(children: [
        Container(
          height: size.height * 0.75,
          width: size.width,
          padding: EdgeInsets.only(top: 30),
          margin: EdgeInsets.only(left: 10, right: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(40),
            gradient: LinearGradient(
                colors: [Color(0xff955cd1), Color(0xff3fa2fa)],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                stops: [0.2, 0.85]),
          ),
          child: Column(children: [
            Text('${data?.cityName}',
                style: TextStyle(
                  color: Colors.white.withOpacity(0.9),
                  fontSize: 35,
                  fontFamily: 'MavenPro',
                )),
            SizedBox(
              height: 10,
            ),
            Text(dateFormat,
                style: TextStyle(
                  color: Colors.white.withOpacity(0.9),
                  fontSize: 15,
                  fontFamily: 'MavenPro',
                )),
            // Image.asset(
            //   'assets/img/sun.png',
            //   width: size.width * 0.3,
            // ),
            Image.network(
              'https:${data?.icon}',
              width: size.width * 0.36,
              fit: BoxFit.fill,
            ),
            SizedBox(
              height: 10,
            ),
            Text('${data?.condition}',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'Hubballi',
                )),
            SizedBox(
              height: 5,
            ),
            Text('${data?.temp}°',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 75,
                  fontWeight: FontWeight.w800,
                  fontFamily: 'Hubballi',
                )),
            SizedBox(
              height: 40,
            ),
            Row(
              children: [
                Expanded(
                    child: Column(children: [
                  Image.asset(
                    'assets/img/storm.png',
                    width: size.width * 0.1,
                  ),
                  Text('${data?.wind} km/h',
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Hubballi',
                          fontSize: 20,
                          fontWeight: FontWeight.bold)),
                  SizedBox(
                    height: 10,
                  ),
                  Text('Wind',
                      style: TextStyle(
                          color: Colors.white.withOpacity(0.5),
                          fontFamily: 'Hubballi',
                          fontSize: 17,
                          fontWeight: FontWeight.bold)),
                ])),
                Expanded(
                    child: Column(children: [
                  Image.asset('assets/img/humidity.png',
                      width: size.width * 0.1),
                  Text('${data?.humidity} %',
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Hubballi',
                          fontSize: 20,
                          fontWeight: FontWeight.bold)),
                  SizedBox(
                    height: 10,
                  ),
                  Text('Humidity',
                      style: TextStyle(
                          color: Colors.white.withOpacity(0.5),
                          fontFamily: 'Hubballi',
                          fontSize: 17,
                          fontWeight: FontWeight.bold)),
                ])),
                Expanded(
                    child: Column(children: [
                  Image.asset(
                    'assets/img/wind-direction.png',
                    width: size.width * 0.1,
                  ),
                  Text('${data?.wind_dir}',
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Hubballi',
                          fontSize: 20,
                          fontWeight: FontWeight.bold)),
                  SizedBox(
                    height: 10,
                  ),
                  Text('Wind Direction',
                      style: TextStyle(
                          color: Colors.white.withOpacity(0.5),
                          fontFamily: 'Hubballi',
                          fontSize: 17,
                          fontWeight: FontWeight.bold)),
                ])),
              ],
            )
          ]),
        ),
        SizedBox(
          height: 20,
        ),
        Row(
          children: [
            Expanded(
                child: Column(
              children: [
                Text('Gust',
                    style: TextStyle(
                        color: Colors.white.withOpacity(0.5),
                        fontFamily: 'MavenPro',
                        fontSize: 17)),
                SizedBox(
                  height: 5,
                ),
                Text('${data?.gust} kp/h',
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'MavenPro',
                        fontSize: 23)),
                SizedBox(
                  height: 20,
                ),
                Text('Pressure',
                    style: TextStyle(
                        color: Colors.white.withOpacity(0.5),
                        fontFamily: 'MavenPro',
                        fontSize: 17)),
                SizedBox(
                  height: 5,
                ),
                Text('${data?.pressure} hpa',
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'MavenPro',
                        fontSize: 23)),
              ],
            )),
            Expanded(
                child: Column(
              children: [
                Text('UV',
                    style: TextStyle(
                        color: Colors.white.withOpacity(0.5),
                        fontFamily: 'MavenPro',
                        fontSize: 17)),
                SizedBox(
                  height: 5,
                ),
                Text('${data?.uv}',
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'MavenPro',
                        fontSize: 23)),
                SizedBox(
                  height: 20,
                ),
                Text('Precipitation',
                    style: TextStyle(
                        color: Colors.white.withOpacity(0.5),
                        fontFamily: 'MavenPro',
                        fontSize: 17)),
                SizedBox(
                  height: 5,
                ),
                Text('${data?.pricipe} mm',
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'MavenPro',
                        fontSize: 23)),
              ],
            )),
            Expanded(
                child: Column(
              children: [
                Text('Wind',
                    style: TextStyle(
                        color: Colors.white.withOpacity(0.5),
                        fontFamily: 'MavenPro',
                        fontSize: 17)),
                SizedBox(
                  height: 5,
                ),
                Text('${data?.wind} km/h',
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'MavenPro',
                        fontSize: 23)),
                SizedBox(
                  height: 20,
                ),
                Text('Last Update',
                    style: TextStyle(
                        color: Colors.white.withOpacity(0.5),
                        fontFamily: 'MavenPro',
                        fontSize: 17)),
                SizedBox(
                  height: 5,
                ),
                Text(
                  '${data?.last_update}',
                  style: TextStyle(
                      color: Colors.green,
                      fontFamily: 'MavenPro',
                      fontSize: 14),
                  textAlign: TextAlign.center,
                ),
              ],
            )),
          ],
        )
      ])),
    ));
  }
}
