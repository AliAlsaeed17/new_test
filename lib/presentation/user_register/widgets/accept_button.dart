// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:new_test/presentation/resources/app_colors.dart';
import 'package:new_test/presentation/user_register/widgets/loading_item.dart';

class AcceptButton extends StatelessWidget {
  AcceptButton({
    super.key,
    required this.text,
    this.backgroundColor = AppColors.red,
    this.textStyle,
    required this.onPressed,
    this.isLoading = false,
  });

  final String text;
  final Color backgroundColor;
  final TextStyle? textStyle;
  final Function()? onPressed;
  bool isLoading;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: isLoading ? () {} : onPressed,
      style: Theme.of(context).elevatedButtonTheme.style!.copyWith(
            backgroundColor: MaterialStatePropertyAll<Color>(backgroundColor),
          ),
      child: Align(
        alignment: Alignment.center,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (isLoading) loadingItem(isWhite: true),
            Text(
              text,
              textAlign: TextAlign.center,
              softWrap: true,
              style: textStyle ?? Theme.of(context).textTheme.titleSmall,
            ),
          ],
        ),
      ),
    );
  }
}
