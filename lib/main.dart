// import 'dart:html';

import 'dart:html';

import 'package:flutter/material.dart';
import 'package:weather_application/repo.dart';
import 'package:weather_application/weather_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  TextEditingController controller = TextEditingController();
  WeatherModel? weatherModel;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Weather App',
        home: Scaffold(
            appBar: AppBar(
              title: const Text("weather app"),
              centerTitle: true,
            ),
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.center,

                children: [
                  const Padding(padding: EdgeInsets.all(15)),
                  const SizedBox(
                    height: 50.0,
                  ),
                  TextField(
                    decoration: const InputDecoration(
                      border: UnderlineInputBorder(),
                      labelText: 'Enter your city name ',
                    ),
                    controller: controller,
                  ),
                  const SizedBox(
                    height: 45.0,
                  ),
                  ElevatedButton(
                      onPressed: () async {
                        weatherModel = await Repo().getWeather(controller.text);

                        setState(() {});
                      },
                      style: ElevatedButton.styleFrom(
                          primary: Colors.purple,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          textStyle: const TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold)),
                      child: const Text("search")),
                  const SizedBox(
                    height: 45.0,
                  ),
                  buildListTile(
                      "Temperature is  ${weatherModel?.main?.temp} °F",
                      Icons.thermostat),
                  const SizedBox(
                    height: 45.0,
                  ),
                  buildListTile(
                      "Humidity  is  ${weatherModel?.main?.tempMax} %",
                      Icons.percent_rounded),
                  const SizedBox(
                    height: 45.0,
                  ),
                  buildListTile(
                      "Air Pressure is  ${weatherModel?.main?.pressure}  hPa",
                      Icons.air_sharp),
                  const SizedBox(
                    height: 100,
                  ),
                  const Text(
                    'Thanks for Using this application',
                    style: TextStyle(color: Colors.lightBlue),
                  )
                ],
              ),
            )));
  }

  ListTile buildListTile(String temp, IconData icon) {
    return ListTile(
      title: Center(child: Text(temp)),
      tileColor: const Color.fromARGB(255, 223, 244, 255),
      leading: Icon(icon),
    );
  }
}
