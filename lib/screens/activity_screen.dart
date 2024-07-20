import 'package:flutter/material.dart';
import 'package:instagram/modal/enums/activity_type_enum.dart';

class ActivityScreen extends StatefulWidget {
  const ActivityScreen({super.key});

  @override
  State<ActivityScreen> createState() => _ActivityScreenState();
}

class _ActivityScreenState extends State<ActivityScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff1C1F2E),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: 79,
              child: TabBar(
                controller: _tabController,
                labelStyle: TextStyle(fontFamily: 'gb', fontSize: 20),
                indicatorColor: Color.fromRGBO(243, 83, 131, 1),
                indicatorWeight: 4,
                indicatorPadding: EdgeInsets.symmetric(horizontal: 20),
                tabs: [
                  Tab(
                    height: 36,
                    text: ('Following'),
                  ),
                  Tab(
                    height: 36,
                    text: ('You'),
                  ),
                ],
              ),
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  _getSampleList(),
                  _getSampleList(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _getSampleList() {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.only(left: 30, right: 20, top: 32),
            child: Text(
              'New',
              style: TextStyle(
                  color: Colors.white, fontFamily: 'GB', fontSize: 16),
            ),
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              return _getRow(ActivityStatus.following);
            },
            childCount: 1,
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              return _getRow(ActivityStatus.likes);
            },
            childCount: 1,
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.only(left: 30, right: 20, top: 32),
            child: Text(
              'Today',
              style: TextStyle(
                  color: Colors.white, fontFamily: 'GB', fontSize: 16),
            ),
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              return _getRow(ActivityStatus.following);
            },
            childCount: 1,
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              return _getRow(ActivityStatus.likes);
            },
            childCount: 1,
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              return _getRow(ActivityStatus.followBack);
            },
            childCount: 1,
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.only(left: 30, right: 20, top: 32),
            child: Text(
              'This week',
              style: TextStyle(
                  color: Colors.white, fontFamily: 'GB', fontSize: 16),
            ),
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              return _getRow(ActivityStatus.likes);
            },
            childCount: 2,
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              return _getRow(ActivityStatus.following);
            },
            childCount: 1,
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              return _getRow(ActivityStatus.followBack);
            },
            childCount: 2,
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              return _getRow(ActivityStatus.likes);
            },
            childCount: 1,
          ),
        ),
        SliverPadding(
          padding: EdgeInsets.only(
            left: 17,
            right: 17,
            top: 32,
          ),
        ),
      ],
    );
  }

  Widget _getRow(ActivityStatus status) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 18),
      child: Row(
        children: [
          Container(
            height: 6,
            width: 6,
            decoration: BoxDecoration(
                shape: BoxShape.circle, color: Color.fromRGBO(243, 83, 131, 1)),
          ),
          SizedBox(
            width: 7,
          ),
          SizedBox(
            width: 40,
            height: 40,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: FittedBox(
                fit: BoxFit.cover,
                child: Image.asset('assets/images/item12.png'),
              ),
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    'amirmohamadadibi',
                    style: TextStyle(
                        color: Colors.white, fontFamily: 'GB', fontSize: 12),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    'Started following',
                    style: TextStyle(
                        color: Colors.white, fontFamily: 'Gm', fontSize: 12),
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    'you',
                    style: TextStyle(
                        color: Colors.white, fontFamily: 'gm', fontSize: 12),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    '3min',
                    style: TextStyle(
                        color: Colors.white, fontFamily: 'Gb', fontSize: 12),
                  ),
                ],
              ),
            ],
          ),
          Spacer(),
          _getActionActivityRow(status)
        ],
      ),
    );
  }

  Widget _getActionActivityRow(ActivityStatus status) {
    switch (status) {
      case ActivityStatus.followBack:
        return ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Color(0xffF35383),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          onPressed: () {},
          child: Text(
            'Follow',
            style:
                TextStyle(color: Colors.white, fontFamily: 'Gb', fontSize: 12),
          ),
        );
      case ActivityStatus.likes:
        return SizedBox(
          width: 40,
          height: 40,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: FittedBox(
              fit: BoxFit.cover,
              child: Image.asset('assets/images/item10.png'),
            ),
          ),
        );
      case ActivityStatus.following:
        return OutlinedButton(
          onPressed: () {},
          style: OutlinedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            side: BorderSide(
              width: 2,
              color: Color.fromRGBO(197, 197, 197, 1),
            ),
          ),
          child: Text(
            'Message',
            style:
                TextStyle(color: Colors.white, fontFamily: 'Gb', fontSize: 9),
          ),
        );

      default:
        return OutlinedButton(
          onPressed: () {},
          style: OutlinedButton.styleFrom(
            side: BorderSide(
              width: 2,
              color: Color.fromRGBO(197, 197, 197, 1),
            ),
          ),
          child: Text(
            'Message',
            style:
                TextStyle(color: Colors.white, fontFamily: 'Gb', fontSize: 12),
          ),
        );
    }
  }
}
