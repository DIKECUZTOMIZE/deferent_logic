import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:untitled/amount_date_add/dbHelper.dart';
import 'package:untitled/amount_date_add/fillterModel.dart';
import 'package:untitled/amount_date_add/note_model.dart';

void main(){
  runApp(AppAmountDate());
}

class  AppAmountDate extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:HomePage() ,
    );
  }
}

class  HomePage extends StatefulWidget {

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  var amountController = TextEditingController();

  AmountDateDbHelper amountDateDbHelper = AmountDateDbHelper.getInstance();

  DateFormat mFormet = DateFormat.yMMMd();

  /// Fillter age call hobo tar pisut ui build hobo
  /// Step5

  List<FillterModel>fillterData = [];

  List<NoteModel>mData = [];

  String type = 'Debit';

  List<String>typeList=['Debit','Credit','Loan','brow', 'loan'];
  @override
  void initState() {
    super.initState();
    getNotes();
  }

  getNotes() async {
   //List<NoteModel> fillterData = await amountDateDbHelper.fectsNotes();
    mData = await amountDateDbHelper.fectsNotes();
       setState(() {});
  }

  @override
  Widget build(BuildContext context) {


    /// Step2:Place Function Object:
    fillterDataDataWise(allNote: fillterData.isNotEmpty ? mData : []);



    return Scaffold(
      appBar: AppBar(title: Text('Home Page'),),


      body: mData.isNotEmpty ? ListView.builder(
        itemCount: mData.length,
        itemBuilder: (context, index) {

          var allData = mData;
          return
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                 Text('${mFormet.format(DateTime.fromMillisecondsSinceEpoch(int.parse(allData[index].created_atM)))}') ,
                  ListTile(
                    title: Text('${allData[index].amountM}'),
                        ),
                ],
              ),
            );
        }
      ) : Center(child: Text('Not note yet!!')

      ),


      floatingActionButton: FloatingActionButton(onPressed: () {
        showModalBottomSheet(context: context, builder: (context) =>
            Container(
              height: 400,
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [

                    Center(child: Text('Add Note')),

                    SizedBox(height: 11,),



                    TextField(
                      controller: amountController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(),
                    ),

                    SizedBox(height: 11,),

                    DropdownMenu(

                      initialSelection: type,

                       onSelected: (typeValue){
                        type = typeValue ?? 'Debit';
                        setState(() {});
                       },

                        dropdownMenuEntries:typeList.map((typeValue){
                          return DropdownMenuEntry(value:typeValue , label: typeValue);
                        }).toList() ),

                    SizedBox(height: 11,),

                    ElevatedButton(onPressed: () async {
                      if (amountController.text.isNotEmpty) {
                        AmountDateDbHelper dbHelper = AmountDateDbHelper
                            .getInstance();

                        bool check = await dbHelper.addNotes(NoteModel(
                            amountM: double.parse(amountController.text),
                            balanceM: 0,
                            typeM: type,
                            created_atM: DateTime.now().millisecondsSinceEpoch.toString()));

                        Navigator.pop(context);
                      }
                    }, child: Text('Add Notes'),

                    ),


                  ],
                ),
              ),
            ),);
      }, child: Text('Add'),),
    );
  }

  /// Step:1: Notes puri ase data bur khai karone lua hoise

  void fillterDataDataWise({required List<NoteModel>allNote}) {

    /// Step3:
    /// Date/Month/Year
    /// Total Amount
    /// List of note

    /// Step6:Logic
    /// Unique Date stroe kuribo babe lage mane Same datot thoka bur eta unique datot list bonabo lage
    List<String>uniuedates = [];

    /// allNoter pora unique date uliabo lagibo:
    for (NoteModel eachnotes1 in allNote) {

      /// Date list add kora hoise
      String ecahdate1 = mFormet.format(DateTime.fromMillisecondsSinceEpoch(
          int.parse(eachnotes1.created_atM)));

      /// check date:
      print(ecahdate1);

      /// Unique date match  hoise judi eta jagat show kora hobo aru  judi match nohoi add kora hobo next date
      ///  Contains mane hl dublicat date bahir kora okl uniqe date store kore
      if (!uniuedates.contains(ecahdate1)) {

        /// judi match nohoi tatia add kora hobo list tot:
        uniuedates.add(ecahdate1);
      }
    }

    /// for r bahirot kora hoise print: uniue date ahise na nai
    print(uniuedates);


    /// Step:7. Uper lofr kam hl , forlopr pora bahirot  olai next logic :
    /// Smae date othai same date thoka allnotse khini eta unique datot list bonai show kuribo lage:

    /// unique date tu bisarim  allnots r pora match kuri match hua bur deferent defrent kora hobo
    for (String ecahUniqueDate in uniuedates) {
      num totalAmount = 0.0;

      /// Date aru notes same bur add kora hoise:
      List<NoteModel>ecahDateNotes = [];

      /// unique date tu match hoise na nai check kora hoise
      for (NoteModel eachNotes2 in allNote) {
           String eachDate2 = mFormet.format(DateTime.fromMillisecondsSinceEpoch(
            int.parse(eachNotes2.created_atM)));

        if (uniuedates == eachDate2) {
           ecahDateNotes.add(eachNotes2);

          if (eachNotes2.typeM == 'Debit') {
            totalAmount += eachNotes2.amountM;
          }
          else {
            totalAmount -= eachNotes2.amountM;
          }
        }
      }
    }
  }
}

/// Step:4:
/// Map or Model bonabo lage (fillterModel),
/// Step: 5 : Fillter : List
