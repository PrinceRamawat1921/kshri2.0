import 'package:flutter/material.dart';
import 'package:kshri2/model/user_details_model.dart';
import 'package:kshri2/utils/constants.dart';
import 'package:kshri2/widgets/banner_ad_widget.dart';
import 'package:kshri2/widgets/categories_horizontal_list_view_bar.dart';
import 'package:kshri2/widgets/products_showcase_list_view.dart';
import 'package:kshri2/widgets/search_bar_widget.dart';
import 'package:kshri2/widgets/simple_product_widget.dart';
import 'package:kshri2/widgets/user_details_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ScrollController controller = ScrollController();
  double offset = 0;

  @override
  void initState() {
    super.initState();
    controller.addListener(() {
      setState(() {
        offset = controller.position.pixels;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SearchBarWidget(
        isReadOnly: true,
        hasBackButton: false,
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            controller: controller,
            child: Column(
              children: [
                SizedBox(
                  height: kAppBarHeight / 2,
                ),
                CategoriesHorizontalListViewBar(),
                BannerAdWidget(),
                ProductsShowcaseListView(
                    title: "Upto 70% Off", children: testChildren),
                ProductsShowcaseListView(
                    title: "Upto 60% Off", children: testChildren),
                ProductsShowcaseListView(
                    title: "Upto 50% Off", children: testChildren),
                ProductsShowcaseListView(
                    title: "Explore", children: testChildren),
              ],
            ),
          ),
          UserDetailsBar(
            offset: offset,
            userDetails:
                UserDetailsModel(name: "Prince", address: "Dhenkikote"),
          ),
        ],
      ),
    );
  }
}
