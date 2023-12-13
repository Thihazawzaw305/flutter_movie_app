import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_movie_app/resources/colors.dart';
import 'package:flutter_movie_app/resources/dimens.dart';

import '../widgets/gradient_view.dart';
import '../widgets/play_button_view.dart';

class BannerView extends StatelessWidget {
  const BannerView({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: BannerImageView(),
        ),
     Positioned.fill(
       child: GradientView(),
     ),
        Align(
          alignment: Alignment.bottomLeft,
          child: BannerTitleView(),
        ),
        Align(
          alignment: Alignment.center,
          child: PlayButtonView(),
        )
      ],
    );
  }
}





class BannerTitleView extends StatelessWidget {
  const BannerTitleView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding:  EdgeInsets.all(MARGIN_MEDIUM_2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text("Across The Spider Verse",
          style: TextStyle(color: Colors.white,fontSize: TEXT_HEADING_1X,fontWeight: FontWeight.w500),
          ),
          Text("Official Review",
            style: TextStyle(color: Colors.white,fontSize: TEXT_HEADING_1X,fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}

class BannerImageView extends StatelessWidget {
  const BannerImageView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Image.network(
      "https://www.whiteboardjournal.com/wp-content/uploads/2023/06/221213152642-01-spiderman-across-the-spider-verse-2023.jpg",fit: BoxFit.cover
    );
  }
}
