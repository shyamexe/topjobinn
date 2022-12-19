import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginPlaceHolder extends StatelessWidget {
  const LoginPlaceHolder({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 340.h,
      width: 1.sw,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            children: [
              Text(
            'Welcome to',
            style:
                TextStyle(fontSize: 13.sp, color: Colors.grey.shade400),
          ),
          SvgPicture.asset('assets/svg/appIcon.svg'),
            ],
          ),
          SizedBox(
              width: 1.sw,
              child: SvgPicture.asset(
                'assets/svg/loginPlaceholder.svg',
                // fit: BoxFit.fitWidth,
              )),
        ],
      ),
    );
  }
}
