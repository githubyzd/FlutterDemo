import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'dart:async';

class BannerWidget extends StatefulWidget {
  final List<String> images;
  BannerWidget(this.images, {Key key}): super(key: key); 
  _BannerWidgetState createState() => _BannerWidgetState();
}

class _BannerWidgetState extends State<BannerWidget> {
  final pageController = PageController(initialPage: 0);
  Timer timer;

  void resetTimer() {
    clearTimer();
    timer = Timer.periodic(Duration(seconds: 3), (timer) {
      if (pageController.positions.isNotEmpty) {
        var i = pageController.page.toInt() + 1;
        pageController.animateToPage(
          i, 
          duration: Duration(milliseconds: 100),
          curve: Curves.linear
        );
        if (i == widget.images.length-1) {
          pageController.jumpToPage(0);
          i = 0;
        }
      }
    });
  }

  void clearTimer() {
    if (timer != null) {
      timer.cancel();
      timer = null;
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    resetTimer();
  }

  @override
  Widget build(BuildContext context){
    if (widget.images.length == 0) {
      return null;
    }
    return SizedBox(
      height: 231.0,
      width: MediaQuery.of(context).size.width,
      child: PageView.builder(
        controller: pageController,
        physics: PageScrollPhysics(parent: ClampingScrollPhysics()),
        itemCount: widget.images.length,
        itemBuilder: (context, index){
          final url = widget.images[index];
          return Image(
            image: CachedNetworkImageProvider(url),
            fit: BoxFit.cover,
          );
        },
      ) 
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    clearTimer();
    super.dispose();
  }
}