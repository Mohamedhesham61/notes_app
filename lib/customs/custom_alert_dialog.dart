import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void customAlertDialog({
  required BuildContext context,
  required final String title,
  required final String desc,
  final Color? descColor,
  required final String rightButtonTitle,
  final Color? rightButtonColor,
  required Function() rightButtonOnTap,
  required final String leftButtonTitle,
  final Color? leftButtonColor,
  required Function() leftButtonOnTap,
}) {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      backgroundColor: Colors.transparent,
      contentPadding: EdgeInsets.zero,
      elevation: 5,
      content: Container(
        height: 160.h,
        width: 350.w,
        decoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Center(
          child: ListView(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 10.h),
                child: Center(
                  child: Text(
                    title,
                    style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10.h),
                child: Center(
                  child: Text(
                    desc,
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: descColor ?? Colors.red,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              SizedBox(height: 10.h),
              Padding(
                padding: EdgeInsets.only(bottom: 20.h, left: 10.w),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: InkWell(
                        onTap: rightButtonOnTap,
                        child: Container(
                          height: 40.h,
                          width: 100.w,
                          decoration:
                              BoxDecoration(color: rightButtonColor ?? Colors.red, borderRadius: BorderRadius.circular(7)),
                          child: Center(
                            child: Text(
                              rightButtonTitle,
                              style: TextStyle(color: Colors.white, fontSize: 12.sp,fontWeight: FontWeight.bold ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: InkWell(
                        onTap: leftButtonOnTap,
                        child: Container(
                          height: 40.h,
                          width: 100.w,
                          decoration: BoxDecoration(color: Colors.transparent, borderRadius: BorderRadius.circular(7)),
                          child: Center(
                            child: Text(
                              leftButtonTitle,
                              style: TextStyle(color: leftButtonColor ?? Colors.black, fontSize: 14.sp, fontWeight: FontWeight.bold,),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
