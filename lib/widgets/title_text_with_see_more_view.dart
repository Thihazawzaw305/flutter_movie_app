

import 'package:flutter/cupertino.dart';
import 'package:flutter_movie_app/widgets/see_more_text.dart';
import 'package:flutter_movie_app/widgets/tilte_text.dart';

class TitleTextWithSeeMoreView extends StatelessWidget {
  final String showcaseText;

  final String seeMoreText;
  final bool seeMoreButtonVisibility;

  TitleTextWithSeeMoreView(this.showcaseText, this.seeMoreText,{this.seeMoreButtonVisibility = true});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        TitleText(
          showcaseText,
        ),
        Spacer(),
        Visibility(visible: seeMoreButtonVisibility,
        child: SeeMoreText(seeMoreText)),
      ],
    );
  }
}
