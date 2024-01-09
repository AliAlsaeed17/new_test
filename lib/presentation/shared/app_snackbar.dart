import 'package:flutter/material.dart';
import 'package:new_test/presentation/resources/app_colors.dart';
import 'package:new_test/presentation/resources/app_constants.dart';
import 'package:new_test/presentation/resources/app_values.dart';

class AppSnackbar {
  static void showSuccess(BuildContext context, String message) {
    _showSnackbar(context, message, AppColors.lightDeepBlue);
  }

  static void showWarning(BuildContext context, String message) {
    _showSnackbar(context, message, AppColors.darkGrey);
  }

  static void showError(BuildContext context, String message) {
    _showSnackbar(context, message, AppColors.red);
  }

  static void _showSnackbar(
      BuildContext context, String message, Color backgroundColor) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: backgroundColor,
        duration: const Duration(seconds: AppConstants.snackBarDelay),
        content: Padding(
          padding: const EdgeInsets.symmetric(vertical: AppPadding.p8),
          child: Text(
            message,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ),
      ),
    );
  }
}
