import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kotobekia/shared/styles/colors.dart';
import 'package:solar_icons/solar_icons.dart';

import '../constants/images/images_constant.dart';

class BuildUserRowInMessage extends StatelessWidget {
  final TextTheme font;
  final String name;
  final bool male;
  const BuildUserRowInMessage(
      {super.key, required this.font, required this.name,required this.male});

  @override
  Widget build(BuildContext context) {
    final locale = AppLocalizations.of(context);
    return Row(
      children: [
        Icon(
          SolarIconsOutline.shieldUser,
          size: 28.w,
          color: ColorConstant.primaryColor,
        ),
        const Spacer(),
        Column(
          children: [
            Text(
              name,
              style: font.titleMedium!.copyWith(fontSize: 16.sp),
            ),
            // Row(
            //   children: [
            //     Material(
            //         elevation: 2,
            //         borderRadius: BorderRadius.circular(10.r),
            //         child: Container(
            //           alignment: Alignment.center,
            //           width: 32.w, height: 14.h,
            //           //child: SpinKitThreeBounce(color: Colors.black45,size: 16.w,),)),
            //         )),
            //     SizedBox(
            //       width: 2.w,
            //     ),
            //     Text(
            //       locale!.typing,
            //       style: font.displayMedium!
            //           .copyWith(fontSize: 12.sp, fontWeight: FontWeight.bold),
            //     )
            //   ],
            // ),
          ],
        ),
        const Spacer(),
        Stack(
          alignment: Alignment.bottomLeft,
          children: [
            Image.asset(
              male?ImageConstant.userMaleImage:
              ImageConstant.userFemaleImage,
              height: 47.w,
              width: 47.w,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 2.h, left: 2.w),
              child: CircleAvatar(
                radius: 5.r,
                backgroundColor: ColorConstant.primaryColor,
              ),
            )
          ],
        ),
        SizedBox(
          width: 20.w,
        ),
        GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_forward_ios_rounded,
              size: 28.w,
            )),
      ],
    );
  }
}
