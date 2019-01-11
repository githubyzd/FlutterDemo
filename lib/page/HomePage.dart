import 'package:flutter/material.dart';
import 'package:flutter_app/page/Discover.dart';
import 'package:flutter_app/page/MimePage.dart';
import 'package:flutter_app/page/MoviesPage.dart';
import 'package:flutter_app/page/TvPage.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PageController pageController;
  int currentIndex = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    this.pageController = PageController(initialPage: this.currentIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.movie),
            title: Text("电影"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.tv),
            title: Text("电视剧"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.collections),
            title: Text("发现"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            title: Text("我的"),
          ),
        ],
        fixedColor: Colors.blue,
        type: BottomNavigationBarType.fixed,
        onTap: (page) {
          pageController.jumpToPage(page);
        },
        currentIndex: this.currentIndex,
      ),
      body: PageView(
        children: <Widget>[
          MoviesPage(),
          TvPage(),
          DiscoverWidget(),
          MinePage()
        ],
        controller: this.pageController,
        onPageChanged: (index) {
          setState(() {
            this.currentIndex = index;
          });
        },
      ),
    );
  }
}
