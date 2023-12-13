import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_movie_app/pages/movie_detail_page.dart';
import 'package:flutter_movie_app/resources/colors.dart';
import 'package:flutter_movie_app/resources/strings.dart';
import 'package:flutter_movie_app/viewItems/actors_view.dart';
import 'package:flutter_movie_app/viewItems/banner_view.dart';
import 'package:flutter_movie_app/viewItems/movie_view.dart';
import 'package:flutter_movie_app/viewItems/show_case_view.dart';
import 'package:flutter_movie_app/widgets/actors_and_creators_section_view.dart';
import 'package:flutter_movie_app/widgets/see_more_text.dart';
import 'package:flutter_movie_app/widgets/tilte_text.dart';
import 'package:flutter_movie_app/widgets/title_text_with_see_more_view.dart';

import '../resources/dimens.dart';

class HomePage extends StatelessWidget {
  List<String> genreList = [
    "Action",
    "Adventure",
    "Crime",
    "Comedy",
    "Horror",
    "SI-FI"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: PRIMARY_COLOR,
        centerTitle: true,
        title: const Text(
          MAIN_SCREEN_APP_BAR_TITLE,
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700),
        ),
        leading: const Icon(color: Colors.white, Icons.menu),
        actions: const [
          Padding(
            padding: EdgeInsets.only(
                top: 0, left: 0, bottom: 0, right: MARGIN_MEDIUM_2),
            child: Icon(color: Colors.white, Icons.search),
          )
        ],
      ),
      body: Container(
        color: HOME_SCREEN_BACKGROUND_COLOR,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BannerSectionView(),
              SizedBox(height: MARGIN_LARGE),
              BestPopularMoviesAndSerialsSectionView(
                  () => _navigateToMovieDetailScreen(context)

              ),
              SizedBox(height: MARGIN_LARGE),
              CheckMovieShowTimesSection(),
              SizedBox(height: MARGIN_LARGE),
              GenreSectionView(() => _navigateToMovieDetailScreen(context),genreList: genreList),
              SizedBox(height: MARGIN_LARGE),
              ShowCasesSection(),
              SizedBox(height: MARGIN_LARGE),
              ActorsAndCreatorsSectionView(BEST_ACTORS_TITLE,BEST_ACTORS_SEE_MORE),

            ],
          ),
        ),
      ),
    );
  }

  void _navigateToMovieDetailScreen(BuildContext context) {
       Navigator.push(context, MaterialPageRoute(builder: (context) => MovieDetailPage()));
  }
}

class GenreSectionView extends StatelessWidget {
  const GenreSectionView(this.onTapMovie,{
     required this.genreList,
});

  final List<String> genreList;
  final Function onTapMovie;



  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: MARGIN_MEDIUM_2),
          child: DefaultTabController(
            length: genreList.length,
            child: TabBar(
              isScrollable: true,
              indicatorColor: PLAY_BUTTON_COLOR,
              labelColor: Colors.white,
              unselectedLabelColor: HOME_SCREEN_LIST_TITLE_COLOR,
              tabs: genreList
                  .map(
                      (genre) => Tab(
                    child: Text(genre),
                  ),
              )
                  .toList(),
            ),
          ),
        ),
        Container(
          color: PRIMARY_COLOR,
          padding: EdgeInsets.only(top: MARGIN_MEDIUM_2, bottom: MARGIN_LARGE),
          child: HorizontalMovieListView(
            (
                (){
                  onTapMovie();
                }
            )

          ),
        )
        ,
      ],
    );
  }
}

class CheckMovieShowTimesSection extends StatelessWidget {
  const CheckMovieShowTimesSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(MARGIN_LARGE),
      height: SHOW_TIME_HEIGHT,
      color: PRIMARY_COLOR,
      margin: EdgeInsets.symmetric(horizontal: MARGIN_MEDIUM_2),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                MAIN_SCREEN_CHECK_MOVIE_SHOWTIME,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: TEXT_HEADING_1X,
                    fontWeight: FontWeight.w600),
              ),
              Spacer(),
              SeeMoreText(MAIN_SCREEN_SEE_MORE, textColor: PLAY_BUTTON_COLOR),
            ],
          ),
          Spacer(),
          Icon(
            Icons.location_on_rounded,
            color: Colors.white,
            size: BANNER_PLAY_BUTTON_SIZE,
          )
        ],
      ),
    );
  }
}



class ShowCasesSection extends StatelessWidget {
  const ShowCasesSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: MARGIN_MEDIUM_2),
          child: TitleTextWithSeeMoreView(
              SHOW_CASE_TITLE, SHOW_CASE_SEE_MORE_TILTE),
        ),
        SizedBox(height: MARGIN_MEDIUM_2),
        Container(
          height: SHOW_CASES_HEIGHT,
          child: ListView(
            scrollDirection: Axis.horizontal,
            padding:
                EdgeInsets.only(left: MARGIN_MEDIUM_2, right: MARGIN_MEDIUM),
            children: [
              ShowCaseView(),
              ShowCaseView(),
              ShowCaseView(),
            ],
          ),
        ),
      ],
    );
  }
}

class BestPopularMoviesAndSerialsSectionView extends StatelessWidget {
  final Function onTapMovie;
  BestPopularMoviesAndSerialsSectionView(this.onTapMovie);
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
            margin: const EdgeInsets.only(left: MARGIN_MEDIUM_2),
            child:
                TitleText(MAIN_SCREEN_BEST_POPULAR_MOVIES_AND_SERIALS_TITLE)),
        const SizedBox(height: MARGIN_MEDIUM),
        HorizontalMovieListView(
            (){
              onTapMovie();
            }
        ),
      ],
    );
  }
}

class HorizontalMovieListView extends StatelessWidget {
  final Function onTapMovie;

  HorizontalMovieListView(this.onTapMovie);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MOVIE_LIST_HEIGHT,
      child: ListView.builder(
        padding:
            const EdgeInsets.only(left: MARGIN_MEDIUM_2, right: MARGIN_MEDIUM),
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (BuildContext context, int index) {
          return MovieView(
              (){
                onTapMovie();
              }
              );
        },
      ),
    );
  }
}

class BannerSectionView extends StatefulWidget {
  @override
  State<BannerSectionView> createState() => _BannerSectionViewState();
}

class _BannerSectionViewState extends State<BannerSectionView> {
  int _position = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: MediaQuery.of(context).size.height / 3.5,
          child: PageView(
            onPageChanged: (page) {
              setState(() {
                _position = page;
              });
            },
            children: [BannerView(), BannerView(), BannerView()],
          ),
        ),
        SizedBox(height: MARGIN_MEDIUM_2),
        DotsIndicator(
          dotsCount: 3,
          position: _position,
          decorator: DotsDecorator(
              color: HOME_SCREEN_BANNER_DOTS_INACTIVE_COLORS,
              activeColor: PLAY_BUTTON_COLOR),
        )
      ],
    );
  }
}
