import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kotobekia/shared/styles/colors.dart';
import 'package:solar_icons/solar_icons.dart';

class CardDetails extends StatelessWidget {
  final String title;
  final int price;
  final String description;

  final String location;
  final String timeSince;

  const CardDetails({
    super.key,
    required this.title,
    required this.price,
    required this.description,
    required this.location,
    required this.timeSince,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: 16.w,
        vertical: 8.h,
      ),
      height: 240.h,
      width: double.infinity,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
          color: whiteColor,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 3.h),
              child: Text(
                title,
                style: Theme.of(context).textTheme.bodyLarge,
                textAlign: TextAlign.start,
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Text(
                description,
                style: Theme.of(context)
                    .textTheme
                    .displayMedium!
                    .copyWith(fontWeight: FontWeight.w400, color: Colors.black),
                textAlign: TextAlign.start,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            const Spacer(),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 4.h),
              child: Row(
                children: [
                  const Icon(
                    SolarIconsOutline.verifiedCheck,
                    color: primaryColor,
                  ),
                  SizedBox(
                    width: 4.w,
                  ),
                  Container(
                    alignment: Alignment.center,
                    width: 50.w,
                    height: 20.h,
                    decoration: BoxDecoration(
                        color: price == 0
                            ? primaryColor.withOpacity(0.1)
                            : const Color(0xFFD0E6F3),
                        borderRadius: BorderRadius.circular(
                            MediaQuery.sizeOf(context).width / 30)),
                    child: Text(
                      price == 0 ? 'مجاناً' : '$price ج',
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                            // textBaseline: TextBaseline.alphabetic,
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w400,
                            color: price == 0
                                ? primaryColor
                                : const Color(0xFF1077FB),
                          ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 4.h,
            ),
            Divider(
              height: 1.h,
              thickness: 1.5,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 4.h),
              child: Row(
                children: [
                  Icon(
                    SolarIconsOutline.mapPoint,
                    color: const Color(0xFF747474),
                    size: 14.sp,
                  ),
                  SizedBox(
                    width: 4.w,
                  ),
                  Text(
                    location,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const Spacer(),
                  Icon(
                    SolarIconsBold.verifiedCheck,
                    color: const Color(0xFF747474),
                    size: 14.sp,
                  ),
                  SizedBox(
                    width: 4.w,
                  ),
                  Text(
                    timeSince,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}