// ignore_for_file: sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:kshri2/model/product_model.dart';
import 'package:kshri2/model/review_model.dart';
import 'package:kshri2/model/user_details_model.dart';
import 'package:kshri2/utils/color_themes.dart';
import 'package:kshri2/utils/constants.dart';
import 'package:kshri2/utils/utils.dart';
import 'package:kshri2/widgets/cost_widget.dart';
import 'package:kshri2/widgets/custom_main_button.dart';
import 'package:kshri2/widgets/custom_simple_rounded_button.dart';
import 'package:kshri2/widgets/rating_star_widget.dart';
import 'package:kshri2/widgets/review_dialog.dart';
import 'package:kshri2/widgets/review_widget.dart';
import 'package:kshri2/widgets/search_bar_widget.dart';
import 'package:kshri2/widgets/user_details_bar.dart';

class ProductScreen extends StatefulWidget {
  final ProductModel productModel;
  const ProductScreen({
    super.key,
    required this.productModel,
  });

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  Expanded spaceThingy = Expanded(child: Container());

  @override
  Widget build(BuildContext context) {
    Size screenSize = Utils().getScreenSize();
    return SafeArea(
      child: Scaffold(
        appBar: SearchBarWidget(
          hasBackButton: true,
          isReadOnly: true,
        ),
        body: Stack(
          children: [
            SingleChildScrollView(
                child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  SizedBox(
                    height: screenSize.height -
                        (kAppBarHeight + (kAppBarHeight / 2)),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: kAppBarHeight / 2,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 5),
                                    child: Text(
                                      widget.productModel.sellerName,
                                      style: const TextStyle(
                                          color: activeCyanColor, fontSize: 16),
                                    ),
                                  ),
                                  Text(widget.productModel.productName)
                                ],
                              ),
                              RatingStarWidget(
                                  rating: widget.productModel.rating),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(15),
                          child: Container(
                            height: screenSize.height / 3,
                            constraints: BoxConstraints(
                                maxHeight: screenSize.height / 3),
                            child: Image.network(
                              widget.productModel.url,
                            ),
                          ),
                        ),
                        spaceThingy,
                        CostWidget(
                            color: Colors.black,
                            cost: widget.productModel.cost),
                        spaceThingy,
                        CustomMainButton(
                          child: const Text(
                            "Buy Now",
                            style: TextStyle(color: Colors.black),
                          ),
                          color: Colors.orange,
                          isLoading: false,
                          onPressed: () {},
                        ),
                        spaceThingy,
                        CustomMainButton(
                          child: const Text(
                            "Add to cart",
                            style: TextStyle(color: Colors.black),
                          ),
                          color: yellowColor,
                          isLoading: false,
                          onPressed: () {},
                        ),
                        spaceThingy,
                        CustomSimpleRoundedButton(
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (context) => const ReviewDialog(),
                            );
                          },
                          text: "Add a review for this product",
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: screenSize.height,
                    child: ListView.builder(
                      itemCount: 10,
                      itemBuilder: ((context, index) {
                        return ReviewWidget(
                          review: ReviewModel(
                            senderName: "Prince",
                            description: "Very good product",
                            rating: 5,
                          ),
                        );
                      }),
                    ),
                  )
                ],
              ),
            )),
            UserDetailsBar(
              offset: 0,
            ),
          ],
        ),
      ),
    );
  }
}
