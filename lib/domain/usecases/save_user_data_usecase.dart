import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:new_test/core/errors/failure.dart';
import 'package:new_test/domain/repositories/user_repository.dart';
import 'package:pdf/widgets.dart' as p;

class SaveUserDataUseCase {
  SaveUserDataUseCase({
    required UserRepository repository,
  }) : _repository = repository;

  final UserRepository _repository;

  Future<Either<Failure, File?>> call(
      String fileName, List<p.Widget> widgetList) async {
    return await _repository.saveUserData(fileName, widgetList);
  }
}
