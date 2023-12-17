import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kotobekia/shared/styles/colors.dart';
import 'package:solar_icons/solar_icons.dart';

class BuildImportantInfoFlag extends StatelessWidget {
  const BuildImportantInfoFlag({super.key});
  @override
  Widget build(BuildContext context) {
    final locale = AppLocalizations.of(context);
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        color: ColorConstant.dangerColor,
      ),
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4),
      margin: EdgeInsets.symmetric(horizontal: 25.w),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            locale!.most_important_info,
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                fontSize: 12.sp,
                fontWeight: FontWeight.w400,
                color: ColorConstant.whiteColor),
          ),
          SizedBox(
            width: 4.w,
          ),
          Icon(
            SolarIconsBold.lightbulbMinimalistic,
            color: const Color(0xFFFFB8B8),
            size: 11.h,
          )
        ],
      ),
    );
  }
}
