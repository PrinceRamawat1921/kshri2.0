import 'package:flutter/material.dart';
import 'package:kshri2/model/product_model.dart';
import 'package:kshri2/widgets/results_widget.dart';
import 'package:kshri2/widgets/search_bar_widget.dart';

class ResultsScreen extends StatelessWidget {
  final String query;
  const ResultsScreen({
    super.key,
    required this.query,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SearchBarWidget(
        isReadOnly: false,
        hasBackButton: true,
      ),
      body: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: RichText(
                text: TextSpan(
                  children: [
                    const TextSpan(
                      text: "Showing results for ",
                      style: TextStyle(
                        fontSize: 17,
                      ),
                    ),
                    TextSpan(
                      text: query,
                      style: const TextStyle(
                        fontSize: 17,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: GridView.builder(
              itemCount: 9,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 2 / 3,
              ),
              itemBuilder: ((context, index) {
                return ResultsWidget(
                  product: ProductModel(
                    url:
                        "https://th.bing.com/th/id/R.6ecfcb4758fc8601eacf6cb9e02d9c7a?rik=cFXCxmmk%2fkjHoQ&riu=http%3a%2f%2feachdesk.com%2fgallery3%2f30%2ff4%2f74628%2f074628-1-02.jpg&ehk=Epf%2bO%2b27tTuK5GogqBZJP%2b1Gx6845ugFgYMQ15oHMtU%3d&risl=&pid=ImgRaw&r=0",
                    productName: "Red Hoodie",
                    cost: 1099,
                    discount: 0,
                    uid: "sdadas",
                    sellerName: "kshri",
                    sellerUid: "esfeds",
                    rating: 4,
                    noOfRating: 1,
                  ),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}
