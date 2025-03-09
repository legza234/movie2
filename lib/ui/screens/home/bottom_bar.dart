import 'package:flutter/material.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:movie/ui/screens/home/movie_details.dart';
import 'package:movie/ui/screens/profile/profile.dart';
import 'package:movie/ui/screens/search/search.dart';
import 'package:movie/utils/app_colors.dart';

import 'home.dart';


void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainScreen(), // استخدام MainScreen كوحدة تحكم رئيسية
    );
  }
}

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  // قائمة الصفحات المرتبطة بالـ Bottom Navigation Bar
  final List<Widget> _pages = [
    HomeScreen(),      // الشاشة الرئيسية
    search(),
    MovieDetails(),
    ProfilePage(),
    // الصفحة الرئيسية
     // شاشة البحث
       // البروفايل
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: _pages[_currentIndex], // عرض الصفحة الحالية حسب الـ index

      bottomNavigationBar: ConvexAppBar(
        backgroundColor: AppColors.gray,
        activeColor: Colors.yellow,
        color: Colors.white,
        style: TabStyle.fixed, // ✅ استخدم fixed لكن خلي العدد فردي
        height: 65,
        curveSize: 80,
        top: -20,
        cornerRadius: 20,

        items: [
          TabItem(icon: Icons.home, title: 'Home'),
          TabItem(icon: Icons.search, title: 'Search'),
          TabItem(icon: Icons.movie, title: 'Movies'),
          TabItem(icon: Icons.person, title: 'Profile'),
          TabItem(icon: Icons.settings, title: 'Settings'), // ✅ إضافة عنصر جديد ليكون العدد فردي
        ],
        initialActiveIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}


