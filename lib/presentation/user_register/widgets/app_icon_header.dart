import 'package:flutter/material.dart';
import 'package:new_test/presentation/resources/app_assets.dart';
import 'package:new_test/presentation/resources/app_screen_util.dart';

class AppIconHeader extends StatelessWidget {
  const AppIconHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: AppScreenUtil.screenWidth(context) * .5,
      child: Image.asset(
        AppAssets.logoImage,
      ),
    );
  }
}
