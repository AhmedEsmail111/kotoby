import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BuildPalestine extends StatelessWidget {
  final String text;

  const BuildPalestine({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    // final w = MediaQuery.of(context).size.width;
    // final h = MediaQuery.of(context).size.height;

    return Container(
      width: double.infinity,
      height: 32.h,
      color: const Color(0xFFECECEC),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            text,
            style: Theme.of(context).textTheme.displayMedium!.copyWith(
                  fontSize: 12.sp,
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                ),
          ),
          Image.asset(
            'assets/images/palestine _map.png',
            width: 20,
            height: 20,
            fit: BoxFit.cover,
          ),
          Image.asset(
            'assets/images/palestine.png',
            width: 20,
            height: 20,
            fit: BoxFit.cover,
          )
        ],
      ),
    );
  }
}