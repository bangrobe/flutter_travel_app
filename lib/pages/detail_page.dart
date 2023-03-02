import 'package:flutter/material.dart';
import 'package:travel_app/misc/colors.dart';
import 'package:travel_app/widgets/app_button.dart';
import 'package:travel_app/widgets/app_large_text.dart';
import 'package:travel_app/widgets/app_text.dart';
import 'package:travel_app/widgets/responsive_button.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  int gottenStars = 3;
  int selectedIndex = -1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        child: Stack(
          children: [
            Positioned(
              left: 0,
              right: 0,
              child: Container(
                width: double.maxFinite,
                height: 350,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("img/mountain.jpeg"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Positioned(
              left: 20,
              top: 70,
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.menu),
                    color: Colors.white,
                  ),
                ],
              ),
            ),
            Positioned(
              top: 330,
              child: Container(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 30),
                width: MediaQuery.of(context).size.width,
                height: 500,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AppLargeText(
                          text: "Yosemite",
                          color: Colors.black54.withOpacity(0.8),
                        ),
                        AppLargeText(
                          text: '\$250',
                          size: 24,
                          color: AppColors.mainColor,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Icon(Icons.location_on, color: AppColors.mainColor),
                        const SizedBox(
                          width: 5,
                        ),
                        AppText(
                            text: "USA, California",
                            color: AppColors.textColor1),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Wrap(
                          children: List.generate(
                            5,
                            (index) {
                              return Icon(
                                Icons.star,
                                color: index < gottenStars
                                    ? AppColors.starColor
                                    : AppColors.textColor2,
                              );
                            },
                          ),
                        ),
                        const SizedBox(
                          width: 2,
                        ),
                        AppText(
                          text: '(4.0)',
                          color: AppColors.textColor2.withOpacity(0.5),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    AppLargeText(
                      text: "People",
                      color: Colors.black87,
                      size: 16,
                    ),
                    AppText(
                      text: "Number of people in your group",
                      color: AppColors.mainTextColor,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Wrap(
                      children: List.generate(
                        5,
                        (index) {
                          return InkWell(
                            onTap: () {
                              setState(() {
                                selectedIndex = index;
                              });
                            },
                            child: Container(
                              margin: const EdgeInsets.only(right: 10),
                              child: AppButton(
                                size: 48,
                                color: selectedIndex == index
                                    ? Colors.white
                                    : Colors.black,
                                backgroundColor: selectedIndex == index
                                    ? Colors.black
                                    : Colors.white,
                                borderColor: AppColors.buttonBackground,
                                isIcon: false,
                                text: (index + 1).toString(),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    AppLargeText(
                      text: "Description",
                      color: Colors.black.withOpacity(0.8),
                      size: 20,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    AppText(
                      text:
                          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed consequat turpis sit amet enim dictum, in gravida libero blandit. Curabitur turpis tellus, porttitor quis hendrerit ut, ultrices vitae odio. ",
                      color: AppColors.textColor2,
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              left: 20,
              right: 20,
              child: Row(
                children: [
                  AppButton(
                    size: 60,
                    color: AppColors.textColor2,
                    backgroundColor: Colors.white,
                    borderColor: AppColors.textColor2,
                    isIcon: true,
                    icon: Icons.favorite_border,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  ResponsiveButton(
                    width: double.maxFinite,
                    isResponsive: true,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
