import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_movie_app/widgets/rating_view.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../resources/dimens.dart';

class MovieView extends StatelessWidget {

 final Function onTapMovie;

 MovieView(this.onTapMovie);


  @override
  Widget build(BuildContext context) {
    return Container(
      margin:  const EdgeInsets.only(right: MARGIN_MEDIUM),
      width: MOVIE_LIST_WIDTH,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: (){
              onTapMovie();
            },
            child: Image.network("https://www.whiteboardjournal.com/wp-content/uploads/2023/06/221213152642-01-spiderman-across-the-spider-verse-2023.jpg"
            ,height: 180,
            fit: BoxFit.cover,),
          ),
          const Text("One Piece",
          style: TextStyle(
            color: Colors.white,
            fontSize: TEXT_REGULAR_2X,
            fontWeight: FontWeight.w600,
          ),
          ),
          const SizedBox(height: MARGIN_MEDIUM,
          ),
          Row(
            children: [
              const Text(
                "8.0",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: TEXT_REGULAR,
                    fontWeight: FontWeight.bold
                ),
              ),
              const SizedBox(
                width: MARGIN_MEDIUM,),
              RatingView(),
            ],
          )
        ],
      ),
    );
  }
}
