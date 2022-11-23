import 'package:flutter/material.dart';
import 'package:kshri2/model/user_details_model.dart';
import 'package:kshri2/utils/color_themes.dart';
import 'package:kshri2/utils/constants.dart';
import 'package:kshri2/utils/utils.dart';

class UserDetailsBar extends StatelessWidget {
  final double offset;
  final UserDetailsModel userDetails;
  const UserDetailsBar({
    super.key,
    required this.offset,
    required this.userDetails,
  });

  @override
  Widget build(BuildContext context) {
    Size screenSize = Utils().getScreenSize();
    return Positioned(
      top: -offset / 3,
      child: Container(
        height: kAppBarHeight / 2,
        width: screenSize.width,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: lightBackgroundaGradient,
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 3,
            horizontal: 20,
          ),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: Icon(
                  Icons.location_on_outlined,
                  color: Colors.grey[900],
                ),
              ),
              SizedBox(
                width: screenSize.width * 0.7,
                child: Text(
                  "Deliver to ${userDetails.name} - ${userDetails.address}",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: Colors.grey[900],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
