import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_movie_app/resources/colors.dart';

import '../resources/dimens.dart';

class ActorsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: MARGIN_MEDIUM),
      child: Container(
        width: ACTORS_LIST_WIDTH,
        child: Stack(
          children: [
            Positioned.fill(
              child: ActorsImageView(),
            ),
            FavouriteButtonView(),
            Align(
              alignment: Alignment.bottomCenter,
              child: ActorsNameAndLikeView(),
            ),
          ],
        ),
      ),
    );
  }
}

class ActorsImageView extends StatelessWidget {
  const ActorsImageView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Image.network(
      "https://www.pinkvilla.com/images/2023-08/1832759125_screenshots-69.jpg",
      fit: BoxFit.cover,
    );
  }
}

class FavouriteButtonView extends StatelessWidget {
  const FavouriteButtonView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(MARGIN_MEDIUM),
      child: Align(
        alignment: Alignment.topRight,
        child: Icon(
          Icons.favorite_border,
          color: Colors.white,
        ),
      ),
    );
  }
}

class ActorsNameAndLikeView extends StatelessWidget {
  const ActorsNameAndLikeView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: MARGIN_MEDIUM, vertical: MARGIN_MEDIUM_2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "Iñaki Godoy",
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.w700),
          ),
          Row(
            children: [
              Icon(
                Icons.thumb_up,
                color: Colors.amber,
                size: MARGIN_MEDIUM_2,
              ),
              SizedBox(
                width: MARGIN_SMALL,
              ),
              Text(
                "YOU LIKES 14 MOVIES",
                style: TextStyle(
                    fontSize: 10,
                    color: HOME_SCREEN_LIST_TITLE_COLOR,
                    fontWeight: FontWeight.bold),
              )
            ],
          )
        ],
      ),
    );
  }
}
