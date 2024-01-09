import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_test/core/services/app_services.dart';
import 'package:new_test/core/services/service_locator.dart';
import 'package:new_test/presentation/resources/app_theme.dart';
import 'package:new_test/presentation/user_register/cubit/user_cubit.dart';
import 'package:new_test/presentation/user_register/screens/user_register_screen.dart';

void main() {
  AppServices.initialServices();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.darkTheme,
      home: BlocProvider(
        create: (_) => locator<UserCubit>(),
        child: const UserRegisterScreen(),
      ),
    );
  }
}
