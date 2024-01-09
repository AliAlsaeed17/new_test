import 'package:flutter/material.dart';
import 'package:new_test/presentation/resources/app_colors.dart';
import 'package:new_test/presentation/resources/app_values.dart';

class PageTitle extends StatelessWidget {
  const PageTitle({
    super.key,
    required this.title,
    this.alignment = Alignment.centerRight,
    this.titleColor = AppColors.white,
  });

  final String title;
  final AlignmentGeometry alignment;
  final Color titleColor;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: alignment,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: AppPadding.p10),
        child: Text(
          title,
          softWrap: true,
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: titleColor,
              ),
        ),
      ),
    );
  }
}
