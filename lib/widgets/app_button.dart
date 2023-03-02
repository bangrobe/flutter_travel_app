import 'package:flutter/material.dart';
import 'package:travel_app/misc/colors.dart';
import 'package:travel_app/widgets/app_text.dart';

class AppButton extends StatelessWidget {
  final Color color;
  final Color backgroundColor;
  double? size;
  final Color borderColor;
  String? text;
  IconData? icon;
  bool? isIcon;
  AppButton(
      {Key? key,
      this.text = "Hi",
      this.icon,
      this.isIcon,
      required this.color,
      required this.backgroundColor,
      this.size,
      required this.borderColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60,
      height: 60,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: backgroundColor,
        border: Border.all(
          color: borderColor,
          width: 1.0,
        ),
      ),
      child: isIcon == false
          ? Center(child: AppText(text: text!, color: color))
          : Center(
              child: Icon(
                icon,
                color: color,
              ),
            ),
    );
  }
}
