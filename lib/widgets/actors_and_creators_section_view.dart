

import 'package:flutter/cupertino.dart';
import 'package:flutter_movie_app/widgets/title_text_with_see_more_view.dart';

import '../resources/colors.dart';
import '../resources/dimens.dart';
import '../resources/strings.dart';
import '../viewItems/actors_view.dart';

class ActorsAndCreatorsSectionView extends StatelessWidget {
  final String seeMoreText;

  final String titleText;
  final bool seeMoreButtonVisibility;

  ActorsAndCreatorsSectionView(this.titleText, this.seeMoreText,
      {this.seeMoreButtonVisibility = true});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: PRIMARY_COLOR,
      padding: EdgeInsets.only(top: MARGIN_MEDIUM_2, bottom: MARGIN_XXLARGE),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: MARGIN_MEDIUM_2),
            child: TitleTextWithSeeMoreView(
              titleText,
              seeMoreText,
              seeMoreButtonVisibility: this.seeMoreButtonVisibility,
            ),
          ),
          SizedBox(height: MARGIN_LARGE),
          Container(
            height: ACTORS_LIST_HEIGHT,
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding:
                  EdgeInsets.only(left: MARGIN_MEDIUM_2, right: MARGIN_MEDIUM),
              children: [
                ActorsView(),
                ActorsView(),
                ActorsView(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
