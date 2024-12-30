import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:untitled/amount_date_add/note_model.dart';

class AmountDateDbHelper {

  AmountDateDbHelper._();
  static AmountDateDbHelper getInstance()=>AmountDateDbHelper._();
  Database? mDataD;

  static const NOTE_TABLE = 'n_table';
  static const NOTE_COLUMN_ID = 'n_id';
  static const NOTE_COLUMN_AMOUNT = 'n_amount';
  static const NOTE_COLUMN_CREATED_AT = 'n_created_at';
  static const NOTE_COLUMN_BALANCE = 'n_balanc';
  static const NOTE_COLUMN_TYPE = 'n_type';

  Future<Database>initDB()async{
    mDataD = mDataD ?? await openDB();
    return mDataD!;
  }


  Future<Database>openDB()async{
    var dirPath= await getApplicationDocumentsDirectory();
    var dbPath = join(dirPath.path,'amountDateDb.db');
    return openDatabase(dbPath,version: 1,onCreate: (db, version) {
      print('create DB');
      db.execute('create table $NOTE_TABLE ( $NOTE_COLUMN_ID integer primary key autoIncrement, $NOTE_COLUMN_AMOUNT real, $NOTE_COLUMN_BALANCE real, $NOTE_COLUMN_CREATED_AT text, $NOTE_COLUMN_TYPE text)');
    },);
  }

  Future<bool>addNotes(NoteModel newNoteID)async{
    var db = await initDB();
    int rowsEffected = await db.insert(NOTE_TABLE, newNoteID.toMapM());
    return rowsEffected >0;
  }

  Future<List<NoteModel>>fectsNotes()async{
    var db = await initDB();

    List<NoteModel> newData=[];
    List<Map<String,dynamic>> allNotes = await db.query(NOTE_TABLE);
    for(Map<String,dynamic> eachData in allNotes){
      NoteModel ecahNotes = NoteModel.fromMap(eachData);
      newData.add(ecahNotes);
    }
    return newData;
  }



}
