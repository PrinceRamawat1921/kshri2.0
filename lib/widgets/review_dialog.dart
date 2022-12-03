import 'package:flutter/material.dart';
import 'package:kshri2/model/review_model.dart';
import 'package:kshri2/model/user_details_model.dart';
import 'package:kshri2/providers/user_details_provider.dart';
import 'package:kshri2/resources/cloudfirestore_methods.dart';
import 'package:provider/provider.dart';
import 'package:rating_dialog/rating_dialog.dart';

class ReviewDialog extends StatelessWidget {
  final String productUid;
  const ReviewDialog({
    super.key,
    required this.productUid,
  });

  @override
  Widget build(BuildContext context) {
    return RatingDialog(
      title: const Text(
        'Type a review for this product',
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.bold,
        ),
      ),
      submitButtonText: 'Send',
      commentHint: 'Type Here',
      onSubmitted: (RatingDialogResponse res) async {
        CloudFirestoreClass().uploadReviewToDatabase(
          productUid: productUid,
          model: ReviewModel(
              senderName:
                  Provider.of<UserDetailsProvider>(context, listen: false)
                      .userDetails
                      .name,
              description: res.comment,
              rating: res.rating.toInt()),
        );
      },
    );
  }
}
