import 'package:flutter/material.dart';
import '../../../utils/app_colors.dart';
import 'movie_details.dart';

void main() {
  runApp(homescrean());
}

class homescrean extends StatelessWidget {
  static var routeName;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<String> images = [
    "assets/Card.png",
    "assets/Card2 (1).png",
    "assets/Card.png",
  ];

  int currentIndex = 0;
  int _currentIndex = 0;
  final PageController _pageController = PageController(viewportFraction: 0.5);

  void _showSideDrawer(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent, // جعل الخلفية شفافة
      builder: (context) {
        return Align(
          alignment: Alignment.centerLeft, // محاذاة الشريط إلى اليسار
          child: FractionallySizedBox(
            widthFactor: 0.6, // اجعل الشريط يأخذ 70% من عرض الشاشة
            child: Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.horizontal(right: Radius.circular(20)), // تدوير الحافة اليمنى فقط
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 40),
                  Text("Menu",
                      style: TextStyle(color: Colors.yellow, fontSize: 22, fontWeight: FontWeight.bold)),
                  Divider(color: Colors.yellow),
                  SizedBox(height: 20),
                  _buildMenuItem(Icons.home, "Go To Home"),
                  _buildMenuItem(Icons.dark_mode, "Theme"),
                  _buildMenuItem(Icons.language, "Language"),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20), // فراغ 20 يمين وشمال
                    child: Divider(color: Colors.yellow),
                  ),
                  _buildMenuItem(Icons.settings, "Settings"),
                  _buildMenuItem(Icons.favorite, "Favorites"),
                  _buildMenuItem(Icons.download, "Downloads"),
                  _buildMenuItem(Icons.share, "Share"),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20), // فراغ 20 يمين وشمال
                    child: Divider(color: Colors.yellow),
                  ),
                  _buildMenuItem(Icons.notification_add, "Notifications"),
                  _buildMenuItem(Icons.compare_arrows_outlined, "Strong and Data"),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20), // فراغ 20 يمين وشمال
                    child: Divider(color: Colors.yellow),
                  ),
                  _buildMenuItem(Icons.info_outline, "Help"),

                  _buildMenuItem(Icons.people, "Invite Friend"),
                  _buildMenuItem(Icons.share, "Share"),
                  Spacer(),
                  _buildMenuItem(Icons.logout, "Logout"),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
  Widget _buildMenuItem(IconData icon, String label) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: Row(
        children: [
          Icon(icon, color: Colors.yellow, size: 24),
          SizedBox(width: 15),
          Text(label, style: TextStyle(color: Colors.white, fontSize: 18)),
        ],
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                ColorFiltered(
                  colorFilter: ColorFilter.mode(
                    Colors.black.withOpacity(0.5),
                    BlendMode.darken,
                  ),
                  child: AnimatedSwitcher(
                    duration: Duration(seconds: 1),
                    child: Image.asset(
                      images[currentIndex],
                      key: ValueKey<String>(images[currentIndex]),
                      fit: BoxFit.cover,
                      width: double.infinity,
                      height: 400,
                    ),
                  ),
                ),
                Positioned(
                  top: 50,
                  left: 20,
                  child: IconButton(
                    icon: Icon(Icons.menu, color: Colors.yellow, size: 30),
                    onPressed: () => _showSideDrawer(context),
                  ),
                ),
                Positioned(
                  top: 50,
                  right: 20,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.asset(
                      "assets/Available Now.png",
                      width: 300,
                      height: 100,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 150),
                    Center(
                      child: SizedBox(
                        height: 350,
                        child: PageView.builder(
                          controller: _pageController,
                          itemCount: images.length,
                          onPageChanged: (index) {
                            setState(() {
                              currentIndex = index;
                            });
                          },
                          itemBuilder: (context, index) {
                            return AnimatedBuilder(
                              animation: _pageController,
                              builder: (context, child) {
                                double value = 1.0;
                                if (_pageController.position.haveDimensions) {
                                  value = _pageController.page! - index;
                                  value = (1 - (value.abs() * 0.3)).clamp(0.2, 1.0);
                                }
                                return Center(
                                  child: Transform.scale(
                                    scale: value,
                                    child: child,
                                  ),
                                );
                              },
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => MovieDetails(),
                                    ),
                                  );
                                },
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(15),
                                  child: Image.asset(
                                    images[index],
                                    height: 350,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),

                    ),
                    SizedBox(height: 20,),
                    Center(
                      child:  Image.asset(
                        "assets/Watch Now.png",
                        width: 350,
                        height: 100,
                        fit: BoxFit.cover,
                      ),),
                  ],
                ),

              ],

            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Action",
                      style: TextStyle(color: Colors.white, fontSize: 18)),
                  Row(
                    children: [
                      Text("More Than",
                          style: TextStyle(color: Colors.yellow, fontSize: 18)),
                      SizedBox(width: 10),
                      Icon(Icons.arrow_forward_sharp, color: Colors.yellow),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              height: 250,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: images.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 7.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        images[index],
                        width: 150,
                        height: 350,
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20), // فراغ 20 يمين وشمال
              child: Divider(color: Colors.yellow),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Action",
                      style: TextStyle(color: Colors.white, fontSize: 18)),
                  Row(
                    children: [
                      Text("More Than",
                          style: TextStyle(color: Colors.yellow, fontSize: 18)),
                      SizedBox(width: 10),
                      Icon(Icons.arrow_forward_sharp, color: Colors.yellow),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              height: 250,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: images.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 7.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        images[index],
                        width: 150,
                        height: 350,
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20), // فراغ 20 يمين وشمال
              child: Divider(color: Colors.yellow),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Action",
                      style: TextStyle(color: Colors.white, fontSize: 18)),
                  Row(
                    children: [
                      Text("More Than",
                          style: TextStyle(color: Colors.yellow, fontSize: 18)),
                      SizedBox(width: 10),
                      Icon(Icons.arrow_forward_sharp, color: Colors.yellow),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              height: 250,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: images.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 7.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        images[index],
                        width: 150,
                        height: 350,
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20), // فراغ 20 يمين وشمال
              child: Divider(color: Colors.yellow),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Action",
                      style: TextStyle(color: Colors.white, fontSize: 18)),
                  Row(
                    children: [
                      Text("More Than",
                          style: TextStyle(color: Colors.yellow, fontSize: 18)),
                      SizedBox(width: 10),
                      Icon(Icons.arrow_forward_sharp, color: Colors.yellow),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              height: 250,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: images.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 7.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        images[index],
                        width: 150,
                        height: 350,
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),

    );
  }
}