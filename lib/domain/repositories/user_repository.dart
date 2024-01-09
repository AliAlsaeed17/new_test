import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:new_test/core/errors/failure.dart';
import 'package:pdf/widgets.dart' as p;

abstract class UserRepository {
  Future<Either<Failure, File?>> saveUserData(
      fileName, List<p.Widget> widgetList);
  Future<void> shareUserData(File file);
}
