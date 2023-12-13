import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../resources/dimens.dart';

class RatingView extends StatelessWidget {
  const RatingView({super.key});

  @override
  Widget build(BuildContext context) {
    return RatingBar.builder(
        initialRating: 4.0,
        itemBuilder: (BuildContext context, int index) =>
        const Icon(
          Icons.star,
          color: Colors.amber,
        ) ,
        itemSize: MARGIN_MEDIUM_2,
        onRatingUpdate: (rating){
          print(rating);
        });
  }
}
