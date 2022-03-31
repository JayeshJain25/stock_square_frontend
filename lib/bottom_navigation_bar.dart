import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:stock_square_app/home_screen.dart';

import 'ipo_screen.dart';
import 'market_screen.dart';

class AppBottomNavigationBar extends StatefulWidget {
  const AppBottomNavigationBar({Key? key}) : super(key: key);

  @override
  _MyCustomBottomNavigationBarState createState() =>
      _MyCustomBottomNavigationBarState();
}

class _MyCustomBottomNavigationBarState extends State<AppBottomNavigationBar>
    with SingleTickerProviderStateMixin {
  int _currentIndex = 0;
  bool isDeviceConnected = false;
  late TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 3);
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: const Color(0xFF010101),
        body: TabBarView(
          controller: _tabController,
          children: const [
            HomeScreen(),
            MarketScreen(),
            IPOScreen(),
          ],
        ),
        bottomNavigationBar: Container(
          height: 55,
          decoration: const BoxDecoration(
            color: Color(0xFF0e0c0a),
          ),
          child: TabBar(
            onTap: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            controller: _tabController,
            indicatorSize: TabBarIndicatorSize.label,
            indicatorPadding: const EdgeInsets.all(5.0),
            indicatorColor: const Color(0xFF228B22),
            labelColor: const Color(0xFF52CAF5),
            unselectedLabelColor: Colors.white,
            tabs: [
              Tab(
                child: SizedBox(
                  width: 27,
                  height: 27,
                  child: Image.asset(
                    "assets/home.png",
                  ),
                ),
              ),
              Tab(
                child: SizedBox(
                  width: 27,
                  height: 27,
                  child: Image.asset(
                    "assets/blue-chip.png",
                  ),
                ),
              ),
              Tab(
                child: SizedBox(
                  width: 27,
                  height: 27,
                  child: Image.asset(
                    "assets/ipo.png",
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
