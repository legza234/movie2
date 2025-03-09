import 'package:flutter/material.dart';
import 'package:movie/utils/app_colors.dart';
import 'package:movie/utils/app_icon.dart';
import 'package:movie/utils/image.dart';

class SearchTab extends StatefulWidget {
  const SearchTab({super.key});

  @override
  State<SearchTab> createState() => _SearchTabState();
}

class _SearchTabState extends State<SearchTab> {
  List<String> articles = [];

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(backgroundColor: AppColors.black,
            leading: SizedBox(),
            leadingWidth: 0,
            floating: true,
            toolbarHeight: 88,
            title: TextFormField(
              decoration: InputDecoration(
                prefixIcon: Image.asset(AppIcon.searchIcon),
                fillColor: AppColors.gray,
                filled: true,
                hintText: "Search",
                hintStyle: TextStyle(
                  color: AppColors.white,
                  fontSize: 16,
                ),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide(color: AppColors.black)
                ),
                disabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide(color: AppColors.black)
                ),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide(color: AppColors.black)
                ),
                errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide(color: AppColors.black)
                ),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide(color: AppColors.black)
                ),

              ),
            )
        ),
        if(articles.isEmpty)
          SliverToBoxAdapter(
            child: Center(heightFactor: MediaQuery.of(context).size.height * 0.005,
              child: Image.asset(Appimages.empty,
                width: 124,
                height: 124,),
            ),
          )
      ],
    );
  }
}
