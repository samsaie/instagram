import 'package:flutter/material.dart';

class GalleryScreen extends StatefulWidget {
  const GalleryScreen({super.key});

  @override
  State<GalleryScreen> createState() => _GalleryScreenState();
}

class _GalleryScreenState extends State<GalleryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff1C1F2E),
      body: SafeArea(
        child: Stack(
          alignment: AlignmentDirectional.bottomCenter,
          children: [
            _getWholeScrollingPart(),
            _getBottom(),
          ],
        ),
      ),
    );
  }

  Widget _getBottom() {
    return Container(
      height: 83,
      decoration: BoxDecoration(
        color: Color.fromRGBO(39, 43, 64, 1),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15),
          topRight: Radius.circular(15),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 18, right: 18, top: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Draft',
              style: TextStyle(
                  color: Color.fromRGBO(243, 83, 131, 1),
                  fontFamily: 'Gb',
                  fontSize: 16),
            ),
            Text(
              'Gallery',
              style: TextStyle(
                  color: Colors.white, fontFamily: 'Gb', fontSize: 16),
            ),
            Text(
              'Take',
              style: TextStyle(
                  color: Colors.white, fontFamily: 'Gb', fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }

  Widget _getWholeScrollingPart() {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: _getHeader(),
        ),
        SliverToBoxAdapter(
          child: _getLargPhoto(),
        ),
        SliverPadding(
          padding: EdgeInsets.symmetric(horizontal: 18, vertical: 18),
          sliver: SliverGrid(
            delegate: SliverChildBuilderDelegate((context, index) {
              return Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: FittedBox(
                    fit: BoxFit.cover,
                    child: Image.asset('assets/images/item$index.png'),
                  ),
                ),
              );
            }, childCount: 29),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
          ),
        ),
        SliverPadding(
          padding: EdgeInsets.only(bottom: 83),
        ),
      ],
    );
  }

  Widget _getHeader() {
    return Container(
      margin: EdgeInsets.only(bottom: 5),
      height: 46,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 18),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Post',
                  style: TextStyle(
                      fontFamily: 'GB', color: Colors.white, fontSize: 20),
                ),
                SizedBox(
                  width: 10,
                ),
                Image.asset('assets/images/icon_arrow_down.png'),
                Spacer(),
                Text(
                  'Next',
                  style: TextStyle(
                      fontFamily: 'GB', color: Colors.white, fontSize: 16),
                ),
                SizedBox(
                  width: 5,
                ),
                Image.asset('assets/images/icon_arrow_right_box.png')
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _getLargPhoto() {
    return Container(
      margin: EdgeInsets.only(bottom: 5),
      padding: EdgeInsets.symmetric(horizontal: 18, vertical: 5),
      height: 394,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: FittedBox(
          fit: BoxFit.cover,
          child: Image.asset('assets/images/item9.png'),
        ),
      ),
    );
  }
}
