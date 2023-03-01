// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:travel_app/misc/colors.dart';

import 'package:travel_app/widgets/app_large_text.dart';
import 'package:travel_app/widgets/app_text.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  var images = {
    "balloning.png": "Balloning",
    "kayaking.png": "Kayaking",
    "snorkling.png": "Snorkling",
    "hiking.png": "Hiking",
  };

  @override
  Widget build(BuildContext context) {
    //this dat o do la vi phai khai bao context truoc
    TabController _tabController = TabController(length: 3, vsync: this);
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.only(top: 70, left: 20),
            child: Row(
              children: [
                Icon(Icons.menu, size: 30, color: Colors.black54),
                Expanded(
                  child: Container(),
                ),
                Container(
                  margin: const EdgeInsets.only(right: 20),
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey.withOpacity(0.5),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            margin: const EdgeInsets.only(left: 20),
            child: AppLargeText(text: "Discover"),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            child: Align(
              alignment: Alignment.centerLeft,
              child: TabBar(
                labelPadding: const EdgeInsets.only(left: 20, right: 20),
                controller: _tabController,
                labelColor: Colors.black,
                unselectedLabelColor: Colors.grey,
                isScrollable: true,
                indicatorSize: TabBarIndicatorSize.label,
                indicator: CircleTabIndicator(
                    color: AppColors.mainColor, radius: 4), //Custom Indicator
                tabs: [
                  Tab(
                    text: 'Places',
                  ),
                  Tab(
                    text: "Inspiration",
                  ),
                  Tab(
                    text: 'Emotions',
                  ),
                ],
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(left: 20),
            height: 300,
            width: double.maxFinite,
            child: TabBarView(
              controller: _tabController,
              children: [
                ListView.builder(
                  itemCount: 3,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: const EdgeInsets.only(right: 15, top: 10),
                      width: 200,
                      height: 300,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white,
                        image: DecorationImage(
                          image: AssetImage('img/mountain.jpeg'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    );
                  },
                ),
                Text("Hi Two"),
                Text("Hi Three"),
              ],
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Container(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppLargeText(
                  text: "Explore more",
                  size: 24,
                ),
                AppText(text: 'See all'),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            height: 100,
            width: double.maxFinite,
            margin: const EdgeInsets.only(left: 20),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 4,
              itemBuilder: (_, index) {
                return Container(
                  margin: const EdgeInsets.only(right: 30),
                  child: Column(
                    children: [
                      Container(
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white,
                          image: DecorationImage(
                            image: AssetImage(
                                'img/${images.keys.elementAt(index)}'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Container(
                        child: AppText(
                          text: '${images.values.elementAt(index)}',
                          color: AppColors.textColor2,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

//Create custom Tab indicator
class CircleTabIndicator extends Decoration {
  final Color color;
  double radius;
  CircleTabIndicator({
    required this.color,
    required this.radius,
  });

  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    // TODO: implement createBoxPainter
    return _CirclePainter(color: color, radius: radius);
  }
}

class _CirclePainter extends BoxPainter {
  final Color color;
  double radius;
  _CirclePainter({
    required this.color,
    required this.radius,
  });
  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    Paint _paint = Paint();
    _paint.color = color;
    _paint.isAntiAlias = true;
    final Offset circleOffset = Offset(
        configuration.size!.width / 2 - radius / 2, configuration.size!.height);
    // TODO: implement paint
    canvas.drawCircle(offset + circleOffset, radius, _paint);
  }
}
