import 'package:flutter/material.dart';
import 'package:kshri2/model/product_model.dart';
import 'package:kshri2/model/user_details_model.dart';
import 'package:kshri2/utils/color_themes.dart';
import 'package:kshri2/utils/constants.dart';
import 'package:kshri2/widgets/cart_item_widget.dart';
import 'package:kshri2/widgets/custom_main_button.dart';
import 'package:kshri2/widgets/search_bar_widget.dart';
import 'package:kshri2/widgets/user_details_bar.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: SearchBarWidget(
          hasBackButton: false,
          isReadOnly: true,
        ),
        body: Center(
          child: Stack(
            children: [
              Column(
                children: [
                  const SizedBox(
                    height: kAppBarHeight / 2,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CustomMainButton(
                      child: const Text(
                        "Proceed to buy (n) items",
                        style: TextStyle(color: Colors.black),
                      ),
                      color: yellowColor,
                      isLoading: false,
                      onPressed: () {},
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                        itemCount: 5,
                        itemBuilder: ((context, index) {
                          return CartItemWidget(
                            product: ProductModel(
                              url:
                                  "https://th.bing.com/th/id/R.6ecfcb4758fc8601eacf6cb9e02d9c7a?rik=cFXCxmmk%2fkjHoQ&riu=http%3a%2f%2feachdesk.com%2fgallery3%2f30%2ff4%2f74628%2f074628-1-02.jpg&ehk=Epf%2bO%2b27tTuK5GogqBZJP%2b1Gx6845ugFgYMQ15oHMtU%3d&risl=&pid=ImgRaw&r=0",
                              productName: "Red Hoodie",
                              cost: 1099,
                              discount: 0,
                              uid: "sdadas",
                              sellerName: "kshri",
                              sellerUid: "esfeds",
                              rating: 1,
                              noOfRating: 1,
                            ),
                          );
                        })),
                  ),
                ],
              ),
              UserDetailsBar(
                offset: 0,
              ),
            ],
          ),
        ));
  }
}
