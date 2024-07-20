import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff1C1F2E),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(left: 18, right: 18),
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: _getSearchFiled(),
              ),
              SliverToBoxAdapter(
                child: _getSearchCategoryList(),
              ),
              SliverGrid(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    return Container(
                      child: ClipRRect(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                        child: FittedBox(
                          fit: BoxFit.cover,
                          child: Image.asset('assets/images/item$index.png'),
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
                      QuiltedGridTile(2, 1),
                      QuiltedGridTile(2, 2),
                      QuiltedGridTile(1, 1),
                      QuiltedGridTile(1, 1),
                      QuiltedGridTile(1, 1),
                    ]),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _getSearchFiled() {
    return Container(
      height: 46,
      // margin: EdgeInsets.only(left: 18, top: 12, right: 18),
      decoration: BoxDecoration(
          color: Color.fromRGBO(39, 43, 64, 1),
          borderRadius: BorderRadius.circular(13)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          children: [
            Image.asset('assets/images/icon_search.png'),
            SizedBox(
              width: 15,
            ),
            Expanded(
              child: TextField(
                onChanged: (value) {},
                decoration: InputDecoration(
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  hintText: 'Search',
                  hintStyle: TextStyle(
                      fontFamily: 'Gm', color: Colors.white, fontSize: 12),
                ),
              ),
            ),
            SizedBox(
              width: 15,
            ),
            Image.asset('assets/images/icon_scan.png'),
          ],
        ),
      ),
    );
  }

  Widget _getSearchCategoryList() {
    return Container(
      height: 23,
      margin: EdgeInsets.only(top: 20, bottom: 20),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.only(right: 15),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(8),
              ),
              color: Color.fromRGBO(39, 43, 64, 1),
            ),
            child: Center(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 18, vertical: 4),
                child: Text(
                  'datadta $index',
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'GM',
                      fontWeight: FontWeight.w600,
                      fontSize: 10),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
