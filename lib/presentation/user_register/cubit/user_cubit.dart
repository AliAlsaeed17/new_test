import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:new_test/domain/usecases/save_user_data_usecase.dart';
import 'package:new_test/domain/usecases/share_user_data_usecase.dart';
part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  SaveUserDataUseCase _saveUserDataUseCase;
  ShareUserDataUseCase _shareUserDataUseCase;

  UserCubit(
      {required SaveUserDataUseCase saveUserDataUseCase,
      required ShareUserDataUseCase shareUserDataUseCase})
      : _saveUserDataUseCase = saveUserDataUseCase,
        _shareUserDataUseCase = shareUserDataUseCase,
        super(UserInitialState());

  Future<void> saveUserData(fileName, pdfScreen) async {
    emit(UserSavingState());

    var isUserSaved = await _saveUserDataUseCase.call(fileName, pdfScreen);
    await Future.delayed(const Duration(seconds: 4));
    isUserSaved.fold(
      (failure) => emit(const UserSavingErrorState(errormsg: 'فشل حفظ الملف')),
      (file) => emit(UserSavingSuccessState(file: file)),
    );
  }

  Future<void> shareUserData(file) async {
    await _shareUserDataUseCase.call(file);
  }
}
