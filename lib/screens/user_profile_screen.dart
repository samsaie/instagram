import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class UserProfileScreen extends StatelessWidget {
  const UserProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 112, 131, 226),
      body: DefaultTabController(
        length: 2,
        child: NestedScrollView(
          headerSliverBuilder: (context, isScrolled) {
            return [
              SliverAppBar(
                pinned: true,
                toolbarHeight: 80,
                actions: [
                  Padding(
                    padding: EdgeInsets.only(
                      right: 18,
                    ),
                    child: Icon(
                      Icons.menu,
                      color: Colors.white,
                    ),
                  ),
                ],
                bottom: PreferredSize(
                  preferredSize: Size.fromHeight(10),
                  child: Container(
                    height: 14,
                    decoration: BoxDecoration(
                      color: Color(0xff1C1F2E),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15),
                      ),
                    ),
                  ),
                ),
                backgroundColor: Color(0xff1C1F2E),
                flexibleSpace: FlexibleSpaceBar(
                  background: Image.asset(
                    'assets/images/item1.png',
                    fit: BoxFit.cover,
                  ),
                ),
                expandedHeight: 170,
              ),
              SliverToBoxAdapter(
                child: _getHederProfile(),
              ),
              SliverPersistentHeader(
                pinned: true,
                floating: true,
                delegate: TabBarViewDelegate(
                  TabBar(
                    indicatorColor: Color.fromRGBO(243, 83, 131, 1),
                    indicatorWeight: 2,
                    indicatorPadding: EdgeInsets.only(
                      left: 18,
                      right: 18,
                    ),
                    tabs: [
                      Tab(
                        icon: Image.asset(
                          'assets/images/icon_tab_posts.png',
                        ),
                      ),
                      Tab(
                        icon:
                            Image.asset('assets/images/icon_tab_bookmark.png'),
                      ),
                    ],
                  ),
                ),
              ),
            ];
          },
          body: TabBarView(children: [
            CustomScrollView(
              slivers: [
                SliverPadding(
                  padding: EdgeInsets.only(top: 20, right: 18, left: 18),
                  sliver: SliverGrid(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        return Container(
                          child: ClipRRect(
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                            child: FittedBox(
                              fit: BoxFit.cover,
                              child:
                                  Image.asset('assets/images/item$index.png'),
                            ),
                          ),
                        );
                      },
                      childCount: 29,
                    ),
                    gridDelegate: SliverQuiltedGridDelegate(
                        crossAxisCount: 3,
                        mainAxisSpacing: 6,
                        crossAxisSpacing: 6,
                        repeatPattern: QuiltedGridRepeatPattern.inverted,
                        pattern: [
                          QuiltedGridTile(1, 1),
                          QuiltedGridTile(2, 2),
                          QuiltedGridTile(1, 1),
                          QuiltedGridTile(1, 1),
                          QuiltedGridTile(1, 1),
                          QuiltedGridTile(1, 1),
                        ]),
                  ),
                )
              ],
            ),
            Container(
              color: Colors.lightGreen,
            )
          ]),
        ),
      ),
    );
  }

  Widget _getHederProfile() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 70,
            width: 70,
            decoration: BoxDecoration(
              border: Border.all(
                width: 2,
                color: Color(0xffF35383),
              ),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Padding(
              padding: EdgeInsets.all(3),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(11),
                child: FittedBox(
                  fit: BoxFit.cover,
                  child: Image.asset('assets/images/profile.png'),
                ),
              ),
            ),
          ),
          SizedBox(
            width: 15,
          ),
          Container(
            height: 70,
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'امیراحمد برنامه نویس موبایل',
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'SM',
                        fontSize: 14,
                        fontWeight: FontWeight.w700),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    'amirahmadadibi',
                    style: TextStyle(
                        fontFamily: 'GB', color: Colors.white, fontSize: 10),
                  ),
                ],
              ),
            ),
          ),
          Spacer(),
          Image.asset('assets/images/icon_profile_edit.png'),
        ],
      ),
    );
  }
}

class TabBarViewDelegate extends SliverPersistentHeaderDelegate {
  TabBarViewDelegate(this._tabBar);
  final TabBar _tabBar;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: Color.fromARGB(48, 205, 225, 53),
      child: _tabBar,
    );
  }

  @override
  double get maxExtent => _tabBar.preferredSize.height;

  @override
  double get minExtent => _tabBar.preferredSize.height;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
