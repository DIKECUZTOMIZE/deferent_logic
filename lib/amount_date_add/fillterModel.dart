import 'package:untitled/amount_date_add/note_model.dart';

/// Step:4

class FillterModel {
  /// Date/month/year: babe ane koi direct String dia hoi hoise
  /// typeName dubar dubar model bunabi nlage asru date/month/year mantion kuri

  String typeName;
  num totalAmount;

  /// eta jagat eta traik r notes bur list kuribo babe
  List<NoteModel> allNote;

  FillterModel(
      {required this.typeName,
      required this.totalAmount,
      required this.allNote});
}
