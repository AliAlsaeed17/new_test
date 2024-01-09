import 'package:new_test/core/util/pdf_helper.dart';
import 'package:pdf/widgets.dart' as p;

Future<List<p.Widget>> buildUserPrintWidget(
    String firstName, String lastName, String email, String phoneNumber) async {
  var printTextStyle = const p.TextStyle(
    height: 1,
  );
  return [
    p.ClipOval(
      child: p.Container(
        width: 70,
        height: 70,
        child: p.Image(p.MemoryImage(
            await PdfHelper.getAssetBytes('assets/images/logo.jpg'))),
      ),
    ),
    p.SizedBox(height: 70),
    p.Align(
      alignment: p.Alignment.centerRight,
      child: p.Padding(
        padding: const p.EdgeInsets.symmetric(vertical: 10),
        child: p.Text(
          'First Name: $firstName',
          softWrap: true,
          textDirection: p.TextDirection.rtl,
          style: printTextStyle.copyWith(
            height: 1,
            fontWeight: p.FontWeight.bold,
            fontSize: 20.0,
          ),
        ),
      ),
    ),
    p.SizedBox(height: 22),
    p.Align(
      alignment: p.Alignment.centerRight,
      child: p.Padding(
        padding: const p.EdgeInsets.symmetric(vertical: 10),
        child: p.Text(
          'First Name: $lastName',
          softWrap: true,
          textDirection: p.TextDirection.rtl,
          style: printTextStyle.copyWith(
            height: 1,
            fontWeight: p.FontWeight.bold,
            fontSize: 20.0,
          ),
        ),
      ),
    ),
    p.SizedBox(height: 22),
  ];
}
