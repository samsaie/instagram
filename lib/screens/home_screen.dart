import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:instagram/screens/share_bottomsheet.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff1C1F2E),
      appBar: AppBar(
        centerTitle: false,
        backgroundColor: Color(0xff1C1F2E),
        elevation: 0,
        title: Container(
          width: 128,
          height: 24,
          child: Image.asset('assets/images/moodinger_logo.png'),
        ),
        actions: [
          Container(
            height: 24,
            width: 24,
            margin: EdgeInsets.only(right: 18),
            child: Image.asset('assets/images/icon_direct.png'),
          )
        ],
      ),
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: _getElevatBottom(context),
            ),
            SliverToBoxAdapter(
              child: _getStoryList(),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate((context, index) {
                return Column(
                  children: [
                    SizedBox(
                      height: 34,
                    ),
                    _getHeaderPost(),
                    SizedBox(
                      height: 24,
                    ),
                    _getPostContend()
                  ],
                );
              }, childCount: 4),
            ),
          ],
        ),
      ),
    );
  }

  Widget _getElevatBottom(context) {
    return ElevatedButton(
        style: ButtonStyle(),
        onPressed: () {
          showModalBottomSheet(
            barrierColor: Colors.transparent,
            backgroundColor: Colors.transparent,
            context: context,
            isScrollControlled: true,
            builder: (BuildContext context) {
              return Padding(
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom),
                child: DraggableScrollableSheet(
                  maxChildSize: 0.65,
                  minChildSize: 0.2,
                  initialChildSize: 0.5,
                  builder: (context, controler) {
                    return ShareBottomSheet(
                      controller: controler,
                    );
                  },
                ),
              );
            },
          );
        },
        child: Text('Open BottomSheet'));
  }

  Widget _getStoryList() {
    return Container(
      height: 120,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (context, index) {
          return index == 0 ? _getAddStoryBox() : _getStoryListBox();
        },
      ),
    );
  }

  Widget _getPostContend() {
    return Container(
      height: 440,
      width: 364,
      child: Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: [
          Positioned.fromRect(
            rect: Rect.fromLTWH(0, 0, 364, 394),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.asset(
                'assets/images/post_cover.png',
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            right: 15,
            top: 15,
            child: Image.asset('assets/images/icon_video.png'),
          ),
          Positioned(
            bottom: 15,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
                child: Container(
                  height: 46,
                  width: 310,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [
                        Color.fromRGBO(255, 255, 255, 0.5),
                        Color.fromRGBO(255, 255, 255, 0.2),
                      ],
                    ),
                  ),
                  child: Row(
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            width: 15,
                          ),
                          Image.asset('assets/images/icon_hart.png'),
                          SizedBox(
                            width: 6,
                          ),
                          Text('2.6 K',
                              style: TextStyle(
                                  fontFamily: 'GB',
                                  color: Colors.white,
                                  fontSize: 14)),
                        ],
                      ),
                      SizedBox(
                        width: 30,
                      ),
                      Row(
                        children: [
                          Image.asset('assets/images/icon_comments.png'),
                          SizedBox(
                            width: 6,
                          ),
                          Text(
                            '1.5 K',
                            style: TextStyle(
                                fontFamily: 'GB',
                                color: Colors.white,
                                fontSize: 14),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 30,
                      ),
                      Row(
                        children: [
                          Image.asset('assets/images/icon_share.png'),
                        ],
                      ),
                      SizedBox(
                        width: 40,
                      ),
                      Row(
                        children: [
                          Image.asset('assets/images/icon_save.png'),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _getHeaderPost() {
    return Padding(
      padding: const EdgeInsets.only(left: 18, right: 18),
      child: Row(
        children: [
          _getStoryBox(),
          SizedBox(
            width: 16,
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('amirahmad adibi',
                    style: TextStyle(
                        fontFamily: 'GB', color: Colors.white, fontSize: 12)),
                Text(
                  'امیراحمد برنامه نویس موبایل',
                  style: TextStyle(color: Colors.white, fontFamily: 'SM'),
                ),
              ],
            ),
          ),
          Spacer(),
          Image.asset('assets/images/icon_menu.png')
        ],
      ),
    );
  }

  Widget _getStoryBox() {
    return DottedBorder(
      borderType: BorderType.RRect,
      radius: Radius.circular(17),
      padding: EdgeInsets.all(4),
      color: Color(0xffF35383),
      strokeWidth: 2,
      dashPattern: [1, 0],
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(15)),
        child: Container(
          height: 40,
          width: 40,
          child: Image.asset('assets/images/profile.png'),
        ),
      ),
    );
  }

  Widget _getStoryListBox() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8, vertical: 12),
      child: Column(
        children: [
          DottedBorder(
            borderType: BorderType.RRect,
            radius: Radius.circular(17),
            padding: EdgeInsets.all(4),
            color: Color(0xffF35383),
            strokeWidth: 2,
            dashPattern: [1, 0],
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(15)),
              child: Container(
                height: 58,
                width: 58,
                child: Image.asset('assets/images/profile.png'),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            'data',
            style:
                TextStyle(fontFamily: 'GM', color: Colors.white, fontSize: 12),
          )
        ],
      ),
    );
  }

  Widget _getAddStoryBox() {
    return Container(
        margin: EdgeInsets.symmetric(horizontal: 8, vertical: 12),
        child: Column(
          children: [
            Container(
              width: 64,
              height: 67,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(17),
              ),
              child: Padding(
                padding: const EdgeInsets.all(2.0),
                child: Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    color: Color(0xff1C1F2E),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Image.asset('assets/images/icon_plus.png'),
                ),
              ),
            ),
            SizedBox(
              height: 9,
            ),
            Text(
              'Your Story',
              style: TextStyle(
                  fontFamily: 'GM', color: Colors.white, fontSize: 12),
            )
          ],
        ));
  }
}
