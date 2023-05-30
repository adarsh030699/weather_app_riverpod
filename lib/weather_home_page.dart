import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_app_riverpod/weather_riverpod.dart';

import 'custom_search_bar.dart';

class WeatherHomePage extends ConsumerWidget {
  const WeatherHomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final weatherNotifier = ref.watch(weatherProvider);
    double temp = weatherNotifier.temprature!;
    String time = weatherNotifier.Time();
    String date = weatherNotifier.Date();
    String greeting = weatherNotifier.greeting();
    int bg = 1;
    int t = temp.round();

    if (greeting == "Morning") {
      print("case 1");
      bg = 1;
    } else if (greeting == "Afternoon") {
      print("case 1");
      bg = 2;
    } else if (greeting == "Evening") {
      print("case 1");
      bg = 3;
    } else {
      bg = 4;
    }
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
            onPressed: () {
              showSearch(
                  context: context,
                  // delegate to customize the search bar
                  delegate: CustomSearchDelegate());
            },
            icon: Icon(Icons.search)),
        actions: [
          Container(
            padding: EdgeInsets.only(right: 10),
            child: Icon(Icons.menu),
          )
        ],
      ),
      body: Container(
          child: Stack(
        children: [
          Image.asset(
            "assets/${bg}.gif",
            fit: BoxFit.cover,
            height: double.infinity,
            width: double.infinity,
          ),
          Container(
            decoration: BoxDecoration(color: Colors.black38),
          ),
          Container(
            padding: EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      weatherNotifier.weather != null
                          ? Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 120,
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Text(
                                  "Pune",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 40,
                                      color: Colors.white),
                                ),
                                Row(
                                  children: [
                                    Text(
                                      " ${time}",
                                      style: TextStyle(
                                          fontSize: 13, color: Colors.white),
                                    ),
                                    Text(
                                      " ${date}",
                                      style: TextStyle(
                                          fontSize: 13, color: Colors.white),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 8.0),
                                  child: Text(
                                    "${weatherNotifier.weather!}",
                                    style: TextStyle(
                                        fontSize: 13, color: Colors.white),
                                  ),
                                )
                              ],
                            )
                          : Container(),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "${t}\u2103",
                            style: TextStyle(
                                fontWeight: FontWeight.w300,
                                fontSize: 85,
                                color: Colors.white),
                          ),
                          Row(
                            children: [
                              Text(
                                greeting,
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w400),
                              ),
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                Column(
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 40),
                      decoration:
                          BoxDecoration(border: Border.all(color: Colors.grey)),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              Text(
                                "Pressure",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                    color: Colors.white),
                              ),
                              Text(
                                "${weatherNotifier.pressure}",
                                style: TextStyle(
                                    fontSize: 15, color: Colors.white),
                              ),
                              Text(
                                "Km/h",
                                style: TextStyle(
                                    fontSize: 14, color: Colors.white),
                              )
                            ],
                          ),
                          Column(
                            children: [
                              Text(
                                "Humidity",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                    color: Colors.white),
                              ),
                              Text(
                                "${weatherNotifier.humidity}",
                                style: TextStyle(
                                    fontSize: 15, color: Colors.white),
                              ),
                              Text(
                                "Km/h",
                                style: TextStyle(
                                    fontSize: 14, color: Colors.white),
                              )
                            ],
                          ),
                          Column(
                            children: [
                              Text(
                                "WindSpeed",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                    color: Colors.white),
                              ),
                              Text(
                                "${weatherNotifier.windspeed}",
                                style: TextStyle(
                                    fontSize: 15, color: Colors.white),
                              ),
                              Text(
                                "Km/h",
                                style: TextStyle(
                                    fontSize: 14, color: Colors.white),
                              )
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                )
              ],
            ),
          )
        ],
      )),
    );
  }
}
