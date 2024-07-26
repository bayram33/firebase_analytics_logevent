import "package:analytics/screens/bussines.dart";
import "package:analytics/screens/home.dart";
import "package:analytics/screens/profile.dart";
import "package:firebase_analytics/firebase_analytics.dart";
import "package:flutter/material.dart";

class InitalPage extends StatefulWidget {
  const InitalPage({super.key});

  @override
  State<InitalPage> createState() => _InitalPageState();
}

class _InitalPageState extends State<InitalPage> {
  static FirebaseAnalytics analytics = FirebaseAnalytics.instance;
  // static FirebaseAnalyticsObserver observer =
  //     FirebaseAnalyticsObserver(analytics: analytics);

  @override
  void initState() {
    analytics.setAnalyticsCollectionEnabled(true);
    super.initState();
  }

  int _selectedIndex = 0;
  static const List<Widget> widgetOptions = [
    HomePage(),
    BussinesPage(),
    ProfilePage(),
  ];

  List<String> pageName = ["Home Page", "Bussines Page", "Profil Page"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Center(child: Text("Firebase Analytics"))),
      body: Center(child: widgetOptions.elementAt(_selectedIndex)),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.business_rounded,
            ),
            label: "Bussines",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
            ),
            label: "Profil",
          )
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.red,
        onTap: (value) async {
          setState(() {
            _selectedIndex = value;
          });
          await analytics.logEvent(
              name: "Event_log_operating",
              parameters: <String, dynamic>{
                "Page_Name": pageName[_selectedIndex],
                "Page_Id": value,
              });
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          // Saat , Tarih , Saniye eventlarını loglama denemesi
          await analytics
              .logEvent(name: "First_Logg", parameters: <String, dynamic>{
            "Page_Name": pageName[_selectedIndex],
            "tarih": DateTime.now().toString(),
          });
        },
        child: const Icon(Icons.architecture),
      ),
    );
  }
}
