import 'package:flutter/material.dart';
import 'package:movie/utils/app_colors.dart';

class BrowseTab extends StatefulWidget {
  const BrowseTab({super.key});

  @override
  State<BrowseTab> createState() => _BrowseTabState();
}

class _BrowseTabState extends State<BrowseTab> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 9,
      child: Scaffold(
        backgroundColor: AppColors.black,
        appBar: AppBar(
          backgroundColor: AppColors.black,
          bottom: TabBar(
            onTap: (index) {
              selectedIndex = index;
              setState(() {
              });
            },
            indicatorColor: Colors.transparent,
            unselectedLabelColor: AppColors.yellow,
            labelColor: AppColors.gray,
            dividerColor: Colors.transparent,
            isScrollable: true,
            // physics: PageScrollPhysics(),
            tabs: [
              builtItemInTabBar(index: 0, text: "Actions"),
              builtItemInTabBar(index: 1, text: "Adventure"),
              builtItemInTabBar(index: 2, text: "Horror"),
              builtItemInTabBar(index: 3, text: "Comedy"),
              builtItemInTabBar(index: 4, text: "Drama"),
              builtItemInTabBar(index: 5, text: "Crime"),
              builtItemInTabBar(index: 6, text: "Romance"),
              builtItemInTabBar(index: 7, text: "Fantasy"),
              builtItemInTabBar(index: 8, text: "Thriller"),
            ],
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: TabBarView(
            children: [
              ListView.separated(
                  itemBuilder: (context, index) => Row(
                    children: [
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.only(right: 3),
                          height: 30,
                          color: Colors.red,
                        ),
                      ),
                      Expanded(
                        child: Container(
                          height: 30,
                          color: Colors.red,
                        ),
                      ),
                    ],
                  ),
                  separatorBuilder: (context, index) => SizedBox(height: 16,),
                  itemCount: 10),
              ListView.separated(
                  itemBuilder: (context, index) => Container(
                    height: 30,
                    color: Colors.yellow,
                  ),
                  separatorBuilder: (context, index) => SizedBox(height: 16,),
                  itemCount: 1000),
              ListView.separated(
                  itemBuilder: (context, index) => Container(
                    height: 30,
                    color: Colors.purple,
                  ),
                  separatorBuilder: (context, index) => SizedBox(height: 16,),
                  itemCount: 1000),
              ListView.separated(
                  itemBuilder: (context, index) => Container(
                    height: 30,
                    color: Colors.orange,
                  ),
                  separatorBuilder: (context, index) => SizedBox(height: 16,),
                  itemCount: 1000),
              ListView.separated(
                  itemBuilder: (context, index) => Container(
                    height: 30,
                    color: Colors.lightGreenAccent,
                  ),
                  separatorBuilder: (context, index) => SizedBox(height: 16,),
                  itemCount: 1000),
              ListView.separated(
                  itemBuilder: (context, index) => Container(
                    height: 30,
                    color: Colors.green,
                  ),
                  separatorBuilder: (context, index) => SizedBox(height: 16,),
                  itemCount: 1000),
              ListView.separated(
                  itemBuilder: (context, index) => Container(
                    height: 30,
                    color: Colors.lightBlue,
                  ),
                  separatorBuilder: (context, index) => SizedBox(height: 16,),
                  itemCount: 1000),
              ListView.separated(
                  itemBuilder: (context, index) => Container(
                    height: 30,
                    color: Colors.grey,
                  ),
                  separatorBuilder: (context, index) => SizedBox(height: 16,),
                  itemCount: 1000),
              ListView.separated(
                  itemBuilder: (context, index) => Container(
                    height: 30,
                    color: Colors.white,
                  ),
                  separatorBuilder: (context, index) => SizedBox(height: 16,),
                  itemCount: 1000),
              // Center(child: Text("data")),
              // Center(child: Text("data")),
              // Center(child: Text("data")),
              // Center(child: Text("data")),
              // Center(child: Text("data")),
              // Center(child: Text("data")),
              // Center(child: Text("data")),
              // Center(child: Text("data")),
              // Center(child: Text("data")),
            ],
          ),
        ),
      ),
    );
  }

  Widget builtItemInTabBar({required int index, required String text}) {
    return selectedIndex == index
        ? Container(
          padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: AppColors.yellow,
          ),
          child: Text(text),
        )
        : Container(
      padding: EdgeInsets.symmetric(vertical: 6, horizontal: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: AppColors.yellow)
        ),
        child: Text(text));
  }
}
