import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_doubanmovie/HotMovieData.dart';
import './HotMovieItemWidget.dart';

class HotMoviesListWidget extends StatefulWidget {
  HotMoviesListWidget({Key key}) : super(key: key);

  _HotMoviesListWidgetState createState() => _HotMoviesListWidgetState();
}

class _HotMoviesListWidgetState extends State<HotMoviesListWidget> {
  List<HotMovieData> hotMovies = new List<HotMovieData>();
  var response = await http.get(
      'https://api.douban.com/v2/movie/in_theaters?apikey=0b2bdeda43b5688921839c8ecb20399b&city=%E6%B7%B1%E5%9C%B3&start=0&count=10');
  @override
  void initState() {
    super.initState();
    var data = HotMovieData('反贪风暴4', 6.3, '林德禄', '古天乐/郑嘉颖/林峯', 29013,
        'https://img3.doubanio.com/view/photo/s_ratio_poster/public/p2551353482.webp');
    setState(() {
      hotMovies.add(data);
      hotMovies.add(data);
      hotMovies.add(data);
      hotMovies.add(data);
      hotMovies.add(data);
      hotMovies.add(data);
    });
  }

  Widget build(BuildContext context) {
    return Container(
        child: ListView.separated(
      itemCount: hotMovies.length,
      itemBuilder: (context, index) {
        return HotMovieItemWidget(hotMovies[index]);
      },
      separatorBuilder: (context, index) {
        return Divider(
          height: 1,
          color: Colors.black26,
        );
      },
    ));
  }
}
