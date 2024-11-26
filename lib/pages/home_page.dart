import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'my_feed_page.dart';
import 'profile_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late PageController _pageController;
  int _currentTap = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        onPageChanged: (int index) {
          setState(() {
            _currentTap = index;
          });
        },
        children:  [
          MyFeedPage(),
          ProfilePage(),
        ],
      ),
      bottomNavigationBar: CupertinoTabBar(
        height: 75,
        onTap: (int index) {
          setState(() {
            _currentTap = index;
          });
          _pageController.animateToPage(
            index,
            duration: const Duration(milliseconds: 200),
            curve: Curves.easeIn,
          );
        },
        currentIndex: _currentTap,
        activeColor: Color(0xFF6D60BC),
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home, size: 35),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat_bubble_outline, size: 35),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: CircleAvatar(
              backgroundColor: Color(0xFF6D60BC),
              child: Icon(Icons.add, color: Colors.white, size: 35),
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications, size: 35),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person, size: 35),
            label: '',
          ),
        ],
      ),
    );
  }
}
