import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_movie_app/resources/dimens.dart';
import 'package:flutter_movie_app/widgets/play_button_view.dart';
import 'package:flutter_movie_app/widgets/tilte_text.dart';

class ShowCaseView extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: MARGIN_MEDIUM),
      width: 300,
      child: Stack(
        children: [
         Positioned.fill(child: 
         Image.network( "https://www.whiteboardjournal.com/wp-content/uploads/2023/06/221213152642-01-spiderman-across-the-spider-verse-2023.jpg",
           fit: BoxFit.cover,),
         ),
          Align(
            alignment: Alignment.center,
            child: PlayButtonView(),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: const EdgeInsets.all(MARGIN_MEDIUM_2),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Spiderman", style: TextStyle(color: Colors.white,fontSize: TEXT_REGULAR_3X, fontWeight: FontWeight.w600),),
                  SizedBox(height: MARGIN_MEDIUM),
                  TitleText("15 December 2022")
                ],
              ),
            ),
          )

        ],
      ),
    );
  }
}
