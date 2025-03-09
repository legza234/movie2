import 'package:flutter/material.dart';

class MovieDetails extends StatefulWidget {
  @override
  _MovieDetailsState createState() => _MovieDetailsState();
}

class _MovieDetailsState extends State<MovieDetails> {
  bool isFavorite = false; // متغير لتغيير لون الأيقونة

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                Image.asset(
                  'assets/card4.png',
                  height: 645,
                  width: 430,
                  fit: BoxFit.cover,
                ),
                IconButton(
                  icon: Icon(Icons.play_circle_fill, color: Colors.yellow, size: 80),
                  onPressed: () {

                  },
                ),
              ],
            ),
            SizedBox(height: 10),
            Center(
              child: Column(
                children: [
                  Text(
                    'Doctor Strange in the Multiverse of Madness',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    '2022',
                    style: TextStyle(color: Colors.white, fontSize: 14),
                  ),
                  SizedBox(height: 10),

                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      padding: EdgeInsets.symmetric(horizontal: 100, vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.play_arrow, color: Colors.yellow),
                        SizedBox(width: 10),
                        Text(
                          'Watch Now',
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(11.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isFavorite = !isFavorite;
                      });
                    },
                    child: Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.2),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.favorite,
                        color: isFavorite ? Colors.red : Colors.yellow,
                        size: 30,
                      ),
                    ),
                  ),
                  Text('15', style: TextStyle(color: Colors.white,fontSize: 24,fontWeight: FontWeight.bold)),
                  Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.2),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(Icons.comment, color: Colors.yellow, size: 30),
                  ),
                  Text('90', style: TextStyle(color: Colors.white,fontSize: 24,fontWeight: FontWeight.bold)),
                  Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.2),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(Icons.star, color: Colors.yellow, size: 30),
                  ),
                  Text('7.6', style: TextStyle(color: Colors.white,fontSize: 24,fontWeight: FontWeight.bold)),
                ],
              ),
            ),


            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Screenshots',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset(
                    "assets/large-screenshot1.png",
                    height: 170,
                    width: 400,
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset(
                    "assets/large-screenshot1.png",
                    height: 170,
                    width: 400,
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Similar',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 400,
              child: GridView.builder(
                scrollDirection: Axis.vertical,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,

                  childAspectRatio: 2/ 3,
                ),
                itemCount: 20,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Image.asset(
                        'assets/card3.png',
                        width: 150,
                        height: 200,
                        fit: BoxFit.cover,
                      ),
                      SizedBox(height: 2),
                      Text(
                        'Movie ${index + 1}',
                        style: TextStyle(color: Colors.white,fontSize: 24,fontWeight: FontWeight.w500),
                      ),
                    ],
                  );
                },
              ),
            ),


            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Summary',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Following the events of Spider-Man No Way Home, Doctor Strange unwittingly casts a forbidden spell...',
                style: TextStyle(color: Colors.grey),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Cast',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Column(
              children: List.generate(
                3,
                    (index) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      CircleAvatar(
                          backgroundImage:
                          NetworkImage('https://via.placeholder.com/50')),
                      SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Actor Name',
                              style: TextStyle(color: Colors.white)),
                          Text('Character Name',
                              style: TextStyle(color: Colors.grey)),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
