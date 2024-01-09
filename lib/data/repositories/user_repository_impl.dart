import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:new_test/core/errors/failure.dart';
import 'package:new_test/core/util/share_helper.dart';
import 'package:pdf/widgets.dart' as p;
import 'package:new_test/core/util/pdf_helper.dart';
import 'package:new_test/domain/repositories/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  PdfHelper _pdfHelper;
  ShareHelper _shareHelper;

  UserRepositoryImpl({
    required PdfHelper pdfHelper,
    required ShareHelper shareHelper,
  })  : _pdfHelper = pdfHelper,
        _shareHelper = shareHelper;

  @override
  Future<Either<Failure, File?>> saveUserData(
      fileName, List<p.Widget> widgetList) async {
    try {
      var savedFile = await _pdfHelper.createPdf(fileName, widgetList);
      return Right(savedFile);
    } on Failure {
      return Left(FileSavingFailure());
    }
  }

  @override
  Future<void> shareUserData(File file) async {
    await _shareHelper.shareFile(file.path);
  }
}
