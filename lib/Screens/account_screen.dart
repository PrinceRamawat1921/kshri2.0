// ignore_for_file: sort_child_properties_last

import 'dart:html';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:kshri2/Screens/sell_screen.dart';
import 'package:kshri2/model/user_details_model.dart';
import 'package:kshri2/providers/user_details_provider.dart';
import 'package:kshri2/utils/color_themes.dart';
import 'package:kshri2/utils/constants.dart';
import 'package:kshri2/utils/utils.dart';
import 'package:kshri2/widgets/account_screen_app_bar.dart';
import 'package:kshri2/widgets/custom_main_button.dart';
import 'package:kshri2/widgets/products_showcase_list_view.dart';
import 'package:provider/provider.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  @override
  Widget build(BuildContext context) {
    Size screenSize = Utils().getScreenSize();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AccountScreenAppBar(),
      body: SingleChildScrollView(
        child: SizedBox(
          height: screenSize.height,
          width: screenSize.width,
          child: Column(
            children: [
              IntroductionWidgetAccountScreen(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CustomMainButton(
                  child: const Text(
                    "Sign Out",
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                  color: Colors.orange,
                  isLoading: false,
                  onPressed: () {
                    FirebaseAuth.instance.signOut();
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CustomMainButton(
                  child: const Text(
                    "Sell",
                    style: TextStyle(color: Colors.black),
                  ),
                  color: yellowColor,
                  isLoading: false,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SellScreen()),
                    );
                  },
                ),
              ),
              ProductsShowcaseListView(
                title: "Your Orders",
                children: testChildren,
              ),
              const Padding(
                padding: EdgeInsets.all(15),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Order Requests",
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Expanded(
                  child: ListView.builder(
                      itemCount: 5,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: const Text(
                            "Order: Black Hoodie",
                            style: TextStyle(fontWeight: FontWeight.w500),
                          ),
                          subtitle: const Text("Address: Dhenkikote"),
                          trailing: IconButton(
                              onPressed: () {}, icon: Icon(Icons.check)),
                        );
                      }))
            ],
          ),
        ),
      ),
    );
  }
}

class IntroductionWidgetAccountScreen extends StatelessWidget {
  const IntroductionWidgetAccountScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UserDetailsModel userDetailsModel =
        Provider.of<UserDetailsProvider>(context).userDetails;
    return Container(
      height: kAppBarHeight / 2,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: backgroundGradient,
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
      ),
      child: Container(
        height: kAppBarHeight / 2,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.white,
              Colors.white.withOpacity(0.00000000001),
            ],
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 17),
              child: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "Hello, ",
                      style: TextStyle(
                        color: Colors.grey[800],
                        fontSize: 26,
                      ),
                    ),
                    TextSpan(
                      text: "${userDetailsModel.name}",
                      style: TextStyle(
                        color: Colors.grey[800],
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(right: 20),
              child: CircleAvatar(
                backgroundImage: NetworkImage(
                    "https://th.bing.com/th/id/OIP.q6aj2O4-hErYs3YZzmPnPwHaHa?w=176&h=180&c=7&r=0&o=5&pid=1.7"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
