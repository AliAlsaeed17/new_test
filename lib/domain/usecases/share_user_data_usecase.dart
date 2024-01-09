import 'dart:io';
import 'package:new_test/domain/repositories/user_repository.dart';

class ShareUserDataUseCase {
  ShareUserDataUseCase({
    required UserRepository repository,
  }) : _repository = repository;

  final UserRepository _repository;

  Future<void> call(File file) async {
    await _repository.shareUserData(file);
  }
}
