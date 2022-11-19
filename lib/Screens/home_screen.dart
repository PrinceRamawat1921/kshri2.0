import 'package:flutter/material.dart';
import 'package:kshri2/widgets/banner_ad_widget.dart';
import 'package:kshri2/widgets/categories_horizontal_list_view_bar.dart';
import 'package:kshri2/widgets/search_bar_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SearchBarWidget(
        isReadOnly: true,
        hasBackButton: false,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [CategoriesHorizontalListViewBar(), BannerAdWidget()],
        ),
      ),
    );
  }
}
