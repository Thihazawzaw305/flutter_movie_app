import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_movie_app/resources/colors.dart';
import 'package:flutter_movie_app/resources/dimens.dart';
import 'package:flutter_movie_app/resources/strings.dart';
import 'package:flutter_movie_app/widgets/actors_and_creators_section_view.dart';
import 'package:flutter_movie_app/widgets/gradient_view.dart';
import 'package:flutter_movie_app/widgets/rating_view.dart';
import 'package:flutter_movie_app/widgets/tilte_text.dart';

class MovieDetailPage extends StatelessWidget {
  List<String> genreList = ["Action", "SI-Fi", "Adventure"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: HOME_SCREEN_BACKGROUND_COLOR,
        child: CustomScrollView(
          slivers: [
            MovieDetailSliverAppBarView(() => Navigator.pop(context),),
            SliverList(
                delegate: SliverChildListDelegate([
              Container(
                margin: EdgeInsets.symmetric(horizontal: MARGIN_MEDIUM_2),
                child: TrailerSectionView(genreList),
              ),
              SizedBox(height: MARGIN_LARGE),
              ActorsAndCreatorsSectionView(
                MOVIE_DETAIL_SCREEN_ACTORS_TITLTE,
                "",
                seeMoreButtonVisibility: false,
              ),
                  SizedBox(height: MARGIN_LARGE),
              Container(
                padding: EdgeInsets.symmetric(horizontal: MARGIN_MEDIUM_2),
                child: AboutFlimSectionView(),
              ),
                  SizedBox(height: MARGIN_LARGE),
              ActorsAndCreatorsSectionView(MOVIE_DETAIL_SCREEN_CREATORS_TITLE,
                  MOVIE_DETAIL_SCREEN_CREATORS_SEE_MORE)
            ]))
          ],
        ),
      ),
    );
  }
}

class AboutFlimSectionView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TitleText("ABOUT FILM"),
        SizedBox(height: MARGIN_MEDIUM_2),
        AboutFlimLabelView("Original Title","Original Tiltefafafih;fjia;glhnasorjeoihoiafhiof"),
        SizedBox(height: MARGIN_MEDIUM_2),
        AboutFlimLabelView("Type","Action, Adventure, SI-FI"),
        SizedBox(height: MARGIN_MEDIUM_2),
        AboutFlimLabelView("Production","USA"),
        SizedBox(height: MARGIN_MEDIUM_2),
        AboutFlimLabelView("Premiere","8 December 2023"),
        SizedBox(height: MARGIN_MEDIUM_2),
        AboutFlimLabelView("Description","Sony began developing a sequel to Into the Spider-Verse prior to its 2018 release, with the writing and directing team attached. It was set to focus on the relationship between Moore's Miles and Steinfeld's Gwen. The sequel was officially announced in November 2019 and animation work began in June 2020, with a different visual style for each of the six universes visited by the characters."
        ),

      ],
    );
  }
}

class AboutFlimLabelView extends StatelessWidget {
final String label ;
final String description ;

AboutFlimLabelView(this.label,this.description);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: MediaQuery.of(context).size.width/4,
          child: Text(
            label,
            style: TextStyle(
                color: MOVIE_DETAIL_INFO_TEXT_COLOR,
                fontSize: MARGIN_MEDIUM_2,
                fontWeight: FontWeight.w600),
          ),
        ),
        SizedBox(width: MARGIN_CARD_MEDIUM_2,),
        Expanded(
          child: Text(
            description,
            style: TextStyle(
                color: Colors.white,
                fontSize: MARGIN_MEDIUM_2,
              fontWeight: FontWeight.w500,
                ),
          ),
        ),
      ],
    );
  }
}

class TrailerSectionView extends StatelessWidget {
  final List<String> genreList;

  TrailerSectionView(this.genreList);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MovieTimeAndGenreView(genreList: genreList),
        SizedBox(height: MARGIN_MEDIUM_3),
        StoryLineView(),
        SizedBox(height: MARGIN_MEDIUM),
        Row(
          children: [
            MovieDetailScreenButtonsView("PLAY TRALIER", PLAY_BUTTON_COLOR,
                Icon(Icons.play_circle_filled, color: Colors.black54)),
            SizedBox(width: MARGIN_CARD_MEDIUM_2),
            MovieDetailScreenButtonsView(
                "RATE MOVIE",
                HOME_SCREEN_BACKGROUND_COLOR,
                Icon(Icons.star, color: PLAY_BUTTON_COLOR),
                isGhostButton: true)
          ],
        )
      ],
    );
  }
}

class MovieDetailScreenButtonsView extends StatelessWidget {
  final String title;
  final Color backgroundColor;

  final Icon buttonIcon;
  final bool isGhostButton;

  MovieDetailScreenButtonsView(
      this.title, this.backgroundColor, this.buttonIcon,
      {this.isGhostButton = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: MARGIN_CARD_MEDIUM_2),
      height: MARGIN_XXLARGE,
      decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(MARGIN_LARGE),
          border: (isGhostButton)
              ? Border.all(color: Colors.white, width: 2)
              : null),
      child: Center(
        child: Row(
          children: [
            buttonIcon,
            SizedBox(width: MARGIN_MEDIUM),
            Text(
              title,
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: TEXT_REGULAR_2X),
            ),
          ],
        ),
      ),
    );
  }
}

class StoryLineView extends StatelessWidget {
  const StoryLineView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TitleText(MOVIE_DETAIL_STORYLINE),
        SizedBox(height: MARGIN_MEDIUM),
        Text(
          "Sony began developing a sequel to Into the Spider-Verse prior to its 2018 release, with the writing and directing team attached. It was set to focus on the relationship between Moore's Miles and Steinfeld's Gwen. The sequel was officially announced in November 2019 and animation work began in June 2020, with a different visual style for each of the six universes visited by the characters.",
          style: TextStyle(color: Colors.white, fontSize: TEXT_REGULAR_2X),
        ),
      ],
    );
  }
}

class MovieTimeAndGenreView extends StatelessWidget {
  const MovieTimeAndGenreView({
    super.key,
    required this.genreList,
  });

  final List<String> genreList;

  @override
  Widget build(BuildContext context) {
    return Row(
        children: [
          Icon(
            Icons.access_time,
            color: PLAY_BUTTON_COLOR,
          ),
          SizedBox(width: MARGIN_SMALL),
          Text(
            "2h 30 min",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            width: MARGIN_MEDIUM,
          ),
          Row(children: genreList.map((genre) => GenreChipView(genre)).toList()),
          Spacer(),
          Icon(Icons.favorite_border, color: Colors.white),
        ],

    );
  }
}

class GenreChipView extends StatelessWidget {
  final String genreText;

  GenreChipView(this.genreText);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Chip(
          side: BorderSide(color: MOVIE_DETAIL_CHIP_BACKGROUND_COLOR),
          backgroundColor: MOVIE_DETAIL_CHIP_BACKGROUND_COLOR,
          label: Text(
            genreText,
            style: TextStyle(
                color: Colors.white,
                fontSize: TEXT_SMALL,
                fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(width: MARGIN_SMALL),
      ],
    );
  }
}

class MovieDetailSliverAppBarView extends StatelessWidget {
  const MovieDetailSliverAppBarView(this.onTapBack,{
    super.key,
  });
final Function onTapBack;
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      automaticallyImplyLeading: false,
      expandedHeight: MediaQuery.of(context).size.height / 2.5,
      flexibleSpace: FlexibleSpaceBar(
        background: Stack(
          children: [
            Positioned.fill(
              child: MovieDetailImageView(),
            ),
            Positioned.fill(child: GradientView()),
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.only(
                    top: MARGIN_XLARGE, left: MARGIN_MEDIUM_2),
                child: BackButtonView(()=>onTapBack()),
              ),
            ),
            Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: const EdgeInsets.only(
                    top: MARGIN_XLARGE + MARGIN_MEDIUM, right: MARGIN_MEDIUM_2),
                child: SearchButtonView(),
              ),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Padding(
                padding: const EdgeInsets.only(
                    left: MARGIN_MEDIUM_2,
                    right: MARGIN_MEDIUM_2,
                    top: MARGIN_MEDIUM_2,
                    bottom: MARGIN_LARGE),
                child: MovieDetailAppBarInfoView(),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class MovieDetailAppBarInfoView extends StatelessWidget {
  const MovieDetailAppBarInfoView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          children: [
            MovieDetailReleaseYearView(),
            Spacer(),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    RatingView(),
                    SizedBox(height: MARGIN_SMALL),
                    TitleText("388876 VOTES"),
                    SizedBox(
                      height: MARGIN_MEDIUM_2,
                    ),
                  ],
                ),
                SizedBox(width: MARGIN_MEDIUM),
                Text(
                  "9,76",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: MOVIE_DETAIL_SCREEN_RATING_TEXT_SIZE,
                  ),
                )
              ],
            )
          ],
        ),
        SizedBox(height: MARGIN_SMALL),
        Text(
          "Spider man",
          style: TextStyle(
              color: Colors.white,
              fontSize: TEXT_HEADING_2X,
              fontWeight: FontWeight.bold),
        )
      ],
    );
  }
}

class MovieDetailReleaseYearView extends StatelessWidget {
  const MovieDetailReleaseYearView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: MARGIN_MEDIUM_2),
      height: MARGIN_XXLARGE,
      decoration: BoxDecoration(
          color: PLAY_BUTTON_COLOR,
          borderRadius: BorderRadius.circular(MARGIN_LARGE)),
      child: Center(
        child: Text(
          "2023",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

class SearchButtonView extends StatelessWidget {
  const SearchButtonView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Icon(
      Icons.search,
      color: Colors.white,
      size: MARGIN_XLARGE,
    );
  }
}

class BackButtonView extends StatelessWidget {
  const BackButtonView(
      this.onTapBack,{
    super.key,
  });
final Function onTapBack;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        onTapBack();
      },
      child: Container(
        width: MARGIN_XXLARGE,
        height: MARGIN_XXLARGE,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.black54,
        ),
        child: Icon(
          Icons.chevron_left,
          color: Colors.white,
          size: MARGIN_XLARGE,
        ),
      ),
    );
  }
}

class MovieDetailImageView extends StatelessWidget {
  const MovieDetailImageView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Image.network(
      "https://www.whiteboardjournal.com/wp-content/uploads/2023/06/221213152642-01-spiderman-across-the-spider-verse-2023.jpg",
      fit: BoxFit.cover,
    );
  }
}
