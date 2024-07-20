import 'package:flutter/material.dart';
import 'package:instagram/screens/activity_screen.dart';
import 'package:instagram/screens/gallery_screen.dart';
import 'package:instagram/screens/home_screen.dart';
import 'package:instagram/screens/search_screen.dart';
import 'package:instagram/screens/user_profile_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedBottomNavigationItem = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15),
          topRight: Radius.circular(15),
        ),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Color(0xff1C1F2E),
          currentIndex: _selectedBottomNavigationItem,
          onTap: (int index) {
            setState(() {
              _selectedBottomNavigationItem = index;
            });
          },
          showSelectedLabels: false,
          showUnselectedLabels: false,
          // unselectedItemColor: Colors.amber,
          // selectedItemColor: Color.fromRGBO(243, 83, 131, 1),
          items: [
            BottomNavigationBarItem(
              icon: Image.asset('assets/images/icon_home.png'),
              activeIcon: Image.asset('assets/images/icon_active_home.png'),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Image.asset('assets/images/icon_search_navigation.png'),
              activeIcon: Image.asset(
                  'assets/images/icon_search_navigation_active.png'),
              label: 'Search',
            ),
            BottomNavigationBarItem(
              icon: Image.asset('assets/images/icon_add_navigation.png'),
              activeIcon:
                  Image.asset('assets/images/icon_add_navigation_active.png'),
              label: 'Add',
            ),
            BottomNavigationBarItem(
              icon: Image.asset('assets/images/icon_activity_navigation.png'),
              activeIcon: Image.asset(
                  'assets/images/icon_activity_navigation_active.png'),
              label: 'Like',
            ),
            BottomNavigationBarItem(
              icon: Container(
                height: 35,
                width: 35,
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 2,
                    color: Color(0xffC5C5C5),
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: EdgeInsets.all(3),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(6),
                    child: FittedBox(
                      fit: BoxFit.cover,
                      child: Image.asset('assets/images/profile.png'),
                    ),
                  ),
                ),
              ),
              activeIcon: Container(
                height: 35,
                width: 35,
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 2,
                    color: Color(0xffF35383),
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: EdgeInsets.all(3),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(6),
                    child: FittedBox(
                      fit: BoxFit.cover,
                      child: Image.asset('assets/images/profile.png'),
                    ),
                  ),
                ),
              ),
              label: 'Profile',
            ),
          ],
        ),
      ),
      body: IndexedStack(
        index: _selectedBottomNavigationItem,
        children: getLayout(),
      ),
    );
  }
}

List<Widget> getLayout() {
  return <Widget>[
    HomeScreen(),
    SearchScreen(),
    GalleryScreen(),
    ActivityScreen(),
    UserProfileScreen(),
  ];
}
