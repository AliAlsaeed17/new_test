import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:new_test/core/extension/email_validation_extension.dart';
import 'package:new_test/presentation/resources/app_values.dart';
import 'package:new_test/presentation/shared/app_snackbar.dart';
import 'package:new_test/presentation/user_register/cubit/user_cubit.dart';
import 'package:new_test/presentation/user_register/screens/user_register_pdf_screen.dart';
import 'package:new_test/presentation/user_register/widgets/accept_button.dart';
import 'package:new_test/presentation/user_register/widgets/app_icon_header.dart';
import 'package:new_test/presentation/user_register/widgets/custom_text_form_field.dart';
import 'package:new_test/presentation/user_register/widgets/page_title.dart';
import 'package:new_test/presentation/user_register/widgets/spacer_height.dart';

class UserRegisterScreen extends StatefulWidget {
  const UserRegisterScreen({super.key});

  @override
  State<UserRegisterScreen> createState() => _UserRegisterScreenState();
}

class _UserRegisterScreenState extends State<UserRegisterScreen> {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    firstNameController.clear();
    firstNameController.dispose();
    lastNameController.clear();
    lastNameController.dispose();
    emailController.clear();
    emailController.dispose();
    phoneController.clear();
    phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Theme.of(context).colorScheme.background,
      body: BlocListener<UserCubit, UserState>(
        listener: (context, state) {
          if (state is UserSavingErrorState) {
            AppSnackbar.showError(context, state.errormsg);
          } else if (state is UserSavingSuccessState) {
            AppSnackbar.showError(context, 'تم تسجيل الدخول بنجاح');
          }
        },
        child: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: AppPadding.p40, vertical: AppPadding.p40),
              child: Column(
                children: [
                  const AppIconHeader(),
                  SpacerHeight(),
                  const PageTitle(
                    alignment: Alignment.center,
                    title: 'Register User',
                  ),
                  SpacerHeight(),
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        CustomTextFormField(
                          controller: firstNameController,
                          keyboardType: TextInputType.name,
                          hintText: 'Enter first name',
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter your first name';
                            }
                            return null;
                          },
                        ),
                        SpacerHeight(height: 22),
                        CustomTextFormField(
                          controller: lastNameController,
                          keyboardType: TextInputType.name,
                          hintText: 'Enter last name',
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter your last name';
                            }
                            return null;
                          },
                        ),
                        SpacerHeight(height: 22),
                        CustomTextFormField(
                          controller: emailController,
                          keyboardType: TextInputType.emailAddress,
                          hintText: 'Enter email',
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter your email';
                            }
                            if (!value.isValidEmail) {
                              return 'Please enter a valid email';
                            }
                            return null;
                          },
                        ),
                        SpacerHeight(height: 22),
                        IntlPhoneField(
                          controller: phoneController,
                          decoration: (const InputDecoration())
                              .applyDefaults(
                                  Theme.of(context).inputDecorationTheme)
                              .copyWith(
                                hintText: 'Enter your phone number',
                              ),
                          initialCountryCode: 'SY',
                          validator: (value) {
                            if (value!.number.isEmpty) {
                              return 'Please enter your phone number';
                            }
                            if (value.number.length < 10) {
                              return 'Please enter a valid 10 digit phone number';
                            }
                            return null;
                          },
                          onChanged: (phone) {
                            print(phone.completeNumber);
                          },
                        ),
                        SpacerHeight(height: 22),
                        BlocBuilder<UserCubit, UserState>(
                          builder: (context, state) {
                            return AcceptButton(
                              onPressed: () async {
                                if (_formKey.currentState!.validate()) {
                                  await context.read<UserCubit>().saveUserData(
                                        '${firstNameController.text}${lastNameController.text}',
                                        await buildUserPrintWidget(
                                            firstNameController.text,
                                            lastNameController.text,
                                            emailController.text,
                                            phoneController.text),
                                      );
                                  if (state is UserSavingSuccessState) {
                                    await context
                                        .read<UserCubit>()
                                        .shareUserData(state.file);
                                  }
                                }
                              },
                              text: 'Continue',
                              isLoading:
                                  state is UserSavingState ? true : false,
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
