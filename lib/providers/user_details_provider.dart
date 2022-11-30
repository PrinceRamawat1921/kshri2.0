import 'package:flutter/material.dart';
import 'package:kshri2/model/user_details_model.dart';
import 'package:kshri2/resources/cloudfirestore_methods.dart';

class UserDetailsProvider with ChangeNotifier {
  UserDetailsModel userDetails;

  UserDetailsProvider()
      : userDetails = UserDetailsModel(
          name: "Loading",
          address: "Loading",
        );

  Future getData() async {
    userDetails = await CloudFirestoreClass().getNameAndAddress();
    notifyListeners();
  }
}
