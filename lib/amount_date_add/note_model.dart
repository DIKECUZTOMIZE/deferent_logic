import 'package:untitled/amount_date_add/dbHelper.dart';

class NoteModel{

  int? id;
  double amountM;
  double balanceM;
  String created_atM;
  String typeM;

  NoteModel({required this.typeM,this.id,required this.amountM,required this.balanceM,required this.created_atM});

  factory NoteModel.fromMap(Map<String,dynamic>map){
    return NoteModel(
        id: map[AmountDateDbHelper.NOTE_COLUMN_ID],
        amountM:map[AmountDateDbHelper.NOTE_COLUMN_AMOUNT],
        balanceM:map[AmountDateDbHelper.NOTE_COLUMN_BALANCE],
        created_atM:map[AmountDateDbHelper.NOTE_COLUMN_CREATED_AT],
       typeM: map[AmountDateDbHelper.NOTE_COLUMN_TYPE]
    );
  }

  Map<String,dynamic>toMapM(){
    return{
      AmountDateDbHelper.NOTE_COLUMN_AMOUNT:amountM,
      AmountDateDbHelper.NOTE_COLUMN_BALANCE:balanceM,
      AmountDateDbHelper.NOTE_COLUMN_CREATED_AT:created_atM,
      AmountDateDbHelper.NOTE_COLUMN_TYPE: typeM
    };
  }

}