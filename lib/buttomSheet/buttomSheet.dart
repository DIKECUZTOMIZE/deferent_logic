import 'package:flutter/material.dart';
import 'package:untitled/buttomSheet/appConstant.dart';

class ButttomSheetPage extends StatefulWidget {

 

  @override
  State<ButttomSheetPage> createState() => _ButttomSheetPageState();
}

class _ButttomSheetPageState extends State<ButttomSheetPage> {
  int selectedInex= -1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          InkWell(
            onTap: () {

              showModalBottomSheet(
                context: context,
                builder: (context) {
                  return Container(
                    height: 250,
                    padding: EdgeInsets.all(21),
                    child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4),
                      itemCount: AppConstant.mdataB.length,
                      itemBuilder: (context, index) => InkWell(
                        onTap: (){
                          selectedInex = index;
                          Navigator.pop(context);
                          setState(() {});
                        },
                        child: Column(
                          children: [
                            Image(
                              image: AssetImage( AppConstant.mdataB[index].imagPath),
                              width: 50,
                              height: 50,
                            ),
                            Text(AppConstant.mdataB[index].title,style: TextStyle(fontSize: 17),
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                },
              );
            },
            child: Center(
              child: Container(
                height: 70,
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(21),
                    border: Border.all(color: Colors.black)),
                child:selectedInex >=0? Row(
                  children: [

                    Image(image: AssetImage(AppConstant.mdataB[selectedInex].imagPath),width: 60,height: 60,),

                      Text(AppConstant.mdataB[selectedInex].title)
                  ],
                )  : Center(
                    child: Text(
                  'Type',
                  style: TextStyle(fontSize: 30),
                )),
              ),
            ),
          ),

          SizedBox(height: 11,),
          Container(
            height: 70,
            width: double.infinity,
            decoration:  BoxDecoration(
              border: Border.all(color: Colors.black),
            ),
            child: selectedInex >=0 ? Row(
              children: [
                Image(image:AssetImage(AppConstant.mdataB[selectedInex].imagPath)),
                Text(AppConstant.mdataB[selectedInex].title)
              ],
            ):Center(child: Text('Choose Category',style: TextStyle(
              fontSize: 30
            ),))
          )

        ],
      ),
    );
  }
}
