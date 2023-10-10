import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomAppBar extends StatelessWidget {
  final String title;
  final Widget widget;
  final bool backButton;

  const CustomAppBar({Key? key, required this.title, required this.widget, required this.backButton}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        backButton
            ? InkWell(
                onTap: () => Navigator.pop(context),
                child: Padding(
                  padding: EdgeInsets.only(right: 5.w),
                  child:const Icon(Icons.arrow_back_ios),
                ),
              )
            : Container(),
        Text(
          title,
          style: TextStyle(
            fontSize: 28.sp,
          ),
        ),
        const Spacer(),
        widget,
      ],
    );
  }
}
