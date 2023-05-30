import 'package:flutter/material.dart';

class CustomSearchDelegate extends SearchDelegate {
  // Demo list to show querying
  List<String> searchTerms = [
    "Delhi",
    "Bangalore",
    "Hyderabad",
    "Ahmedabad",
    "Chennai",
    "Kolkata",
    'Surat',
    "Pune",
    'Jaipur',
    'Lucknow',
    'Kanpur',
    'Nagpur',
    'Indore',
    'Thane',
    'Bhopal',
    'Visakhapatnam',
    'Pimpri-Chinchwad',
    'Patna',
    'Vadodara',
    'Ghaziabad',
    'Ludhiana',
    'Agra',
    'Nashik',
    'Faridabad',
    'Meerut',
    'Rajkot',
    'Kalyan',
    'Vasai',
    'Varanasi',
    'Srinagar',
    'Aurangabad',
    'Dhanbad',
    'Amritsar',
    'NaviMumbai',
    'Prayagraj',
    'Howrah',
    'Ranchi',
    'Gwalior',
    'Jabalpur',
    'Coimbatore',
    'Vijayawada',
    'Jodhpur',
    'Madurai',
    'Raipur',
    'Kota',
    'Chandigarh',
    'Guwahati',
    'Solapur',
    'Hubli–Dharwad',
    'Bareilly',
    'Mysore',
    'Moradabad',
    'Gurgaon',
    'Aligarh',
    'Jalandhar',
    'Tiruchirappalli',
    'Bhubaneswar',
    'Salem',
    'Mira-Bhayandar',
    'Thiruvananthapuram',
    'Bhiwandi',
    'Saharanpur',
    'Gorakhpur',
    'Guntur',
    'Amravati',
    'Bikaner',
    'Noida',
    'Jamshedpur',
    'Bhilai',
    'Warangal',
    'Cuttack',
    'Firozabad',
    'Kochi',
    'Bhavnagar',
    'Dehradun',
    'Durgapur',
    'Asansol',
    'Nanded',
    'Kolhapur',
    'Ajmer',
    'Gulbarga',
    'Loni',
    'Ujjain',
    'Siliguri',
    'Ulhasnagar',
    'Jhansi',
    'Kupwad',
    'Jammu',
    'Nellore',
    'Mangalore',
    'Belgaum',
    'Jamnagar',
    'Tirunelveli',
    'Malegaon',
    'Gaya',
    'Ambattur',
    'Jalgaon',
    'Udaipur',
    'Maheshtala',
    'Tiruppur',
    'Davanagere',
    'Kozhikode',
    'Kurnool',
    'Akola',
    'Rajpur',
    'Bokaro',
    'Bellary',
    'Patiala',
    'South Dum Dum',
    'Rajarhat',
    'Bhagalpur',
    'Agartala',
    'Muzaffarnagar',
    'Bhatpara',
    'Latur',
    'Panihati',
    'Dhule',
    'Rohtak',
    'Korba',
    'Bhilwara',
  ];

  // first overwrite to
  // clear the search text
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: Icon(Icons.clear),
      ),
    ];
  }

  // second overwrite to pop out of search menu
  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: Icon(Icons.arrow_back),
    );
  }

  // third overwrite to show query result
  @override
  Widget buildResults(BuildContext context) {
    List<String> matchQuery = [];
    for (var city in searchTerms) {
      if (city.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(city);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        var result = matchQuery[index];
        return ListTile(
          title: Text(result),
        );
      },
    );
  }

  // last overwrite to show the
  // querying process at the runtime
  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> matchQuery = [];
    for (var city in searchTerms) {
      if (city.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(city);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        var result = matchQuery[index];
        return ListTile(
          title: Text(result),
        );
      },
    );
  }
}
