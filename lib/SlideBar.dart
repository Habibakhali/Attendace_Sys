import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vertical_tabs_flutter/vertical_tabs.dart';

import 'LoginScreen.dart';
import 'ReportDashboard.dart';
import 'SelectImage.dart';
import 'dashboard.dart';
import 'dashboardAbsent.dart';

class SlideBar extends StatelessWidget {
  const SlideBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Attendance',
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24,
              color: Color(0xff92E3A9)),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return LoginScreen();
              }));
            },
            icon: const Icon(Icons.logout),
            color: Colors.black,
          )
        ],
        backgroundColor: Colors.white,
      ),
      body: Row(
        children: [
          Expanded(
            child: VerticalTabs(
              tabsElevation: 10,
              indicatorSide: IndicatorSide.start,
              tabsWidth: 220,
              indicatorColor: const Color(0xff92E3A9),
              selectedTabBackgroundColor: const Color(0xff92E3A9),
              tabs: [
                Tab(
                  child: Padding(
                    padding: EdgeInsets.only(left: 20.0, top: 8, bottom: 8),
                    child: Row(
                      children: [
                        Icon(
                          Icons.dashboard,
                        ),
                        Padding(
                          padding: EdgeInsets.all(4.0),
                          child: Text('Dashboard'),
                        ),
                      ],
                    ),
                  ),
                ),
                Tab(
                  child: Padding(
                    padding: EdgeInsets.only(left: 20.0, top: 8, bottom: 8),
                    child: Row(
                      children: [
                        Icon(Icons.add_photo_alternate_outlined),
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            'Select Image',
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Tab(
                  child: Padding(
                    padding: EdgeInsets.only(left: 20.0, top: 10, bottom: 8),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 0.02,
                        ),
                        Row(
                          children: [
                            Icon(Icons.check_circle_outline),
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text('Attendance'),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Tab(
                  child: Padding(
                    padding: EdgeInsets.only(left: 20.0, top: 10, bottom: 8),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 0.02,
                        ),
                        Row(
                          children: [
                            Icon(Icons.cancel_outlined),
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text('Absent'),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
              contents: [
                ReportDashboard(),
                 SelectImage(),
                 DashboardMainScreen(),
                 DashboardAbsent(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
