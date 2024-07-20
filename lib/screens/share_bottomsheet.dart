import 'dart:ui';

import 'package:flutter/material.dart';

class ShareBottomSheet extends StatelessWidget {
  const ShareBottomSheet({super.key, this.controller});
  final ScrollController? controller;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(36), topRight: Radius.circular(36)),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 60, sigmaY: 60),
        child: Container(
          color: Color.fromRGBO(255, 255, 255, 0.1),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 44),
            child: _getGridView(context),
          ),
        ),
      ),
    );
  }

  Widget _getGridView(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.bottomCenter,
      children: [
        CustomScrollView(
          controller: controller,
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                children: [
                  Container(
                    height: 5,
                    width: 67,
                    margin: EdgeInsets.only(top: 10, bottom: 22),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(
                        Radius.circular(100),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Share',
                        style: TextStyle(
                            fontFamily: 'GB',
                            color: Colors.white,
                            fontSize: 20),
                      ),
                      Image.asset('assets/images/icon_share_bottomsheet.png')
                    ],
                  ),
                  SizedBox(
                    height: 32,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(13)),
                      color: Color.fromRGBO(255, 255, 255, 0.4),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        children: [
                          Image.asset('assets/images/icon_search.png'),
                          SizedBox(
                            width: 8,
                          ),
                          Expanded(
                            child: TextField(
                              onChanged: (value) {},
                              decoration: InputDecoration(
                                enabledBorder: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                hintText: 'Search',
                                hintStyle: TextStyle(
                                    fontFamily: 'Gm',
                                    color: Colors.white,
                                    fontSize: 12),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 32,
                  ),
                ],
              ),
            ),
            SliverGrid(
              delegate: SliverChildBuilderDelegate((context, index) {
                return _getItemGrid();
              }, childCount: 50),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisSpacing: 20,
                mainAxisSpacing: 10,
                crossAxisCount: 4,
                mainAxisExtent: 90,
              ),
            ),
            SliverPadding(
              padding: EdgeInsets.only(top: 100),
            ),
          ],
        ),
        Positioned(
          bottom: 30,
          child: ElevatedButton(
            onPressed: () {},
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 45, vertical: 13),
              child: Text(
                'Share',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _getItemGrid() {
    return Column(
      children: [
        Container(
          width: 60,
          height: 60,
          child: ClipRRect(
            borderRadius: BorderRadius.all(
              Radius.circular(15),
            ),
            child: Image.asset('assets/images/profile.png'),
          ),
        ),
        SizedBox(
          height: 8,
        ),
        Text(
          'data',
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'GB',
            fontSize: 12,
          ),
        )
      ],
    );
  }
}
