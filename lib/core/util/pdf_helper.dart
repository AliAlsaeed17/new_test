// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:new_test/core/errors/failure.dart';
import 'package:new_test/core/util/file_picker_helper.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as p;
import 'package:permission_handler/permission_handler.dart';

class PdfHelper {
  static p.Font? font;
  FilePickerHelper filePickerHelper = FilePickerHelper();

  Future<File?> createPdf(fileName, List<p.Widget> w) async {
    String? selectedFolder = await filePickerHelper.pickFolder();
    if (selectedFolder != null) {
      final pdf = p.Document();

      pdf.addPage(
        p.MultiPage(
          maxPages: 200,
          pageFormat: PdfPageFormat.a4,
          build: (p.Context context) {
            return w;
          },
        ),
      );

      try {
        return await savePdfToFile(selectedFolder, fileName, pdf);
      } catch (e) {
        throw FileSavingFailure();
      }
    }
    return null;
  }

  Future<File?> savePdfToFile(directory, fileName, pdf) async {
    //print("$directory/$fileName.pdf");
    try {
      var status = await Permission.storage.request();
      if (status.isGranted) {
        print(status.isGranted);
        final file = File("$directory/$fileName.pdf");
        File returnedFile =
            await file.writeAsBytes(await pdf.save(), mode: FileMode.write);

        return returnedFile;
      } else {
        return null;
      }
    } catch (e) {
      throw FileSavingFailure();
    }
  }

  static Future<void> getPrintFont() async {
    font =
        p.Font.ttf(await rootBundle.load('assets/fonts/NotoNaskhArabic.ttf'));
  }

  static Future<Uint8List> getAssetBytes(asset) async {
    ByteData bytes = await rootBundle.load(asset);
    return bytes.buffer.asUint8List();
  }
}
