import 'dart:ffi';

import 'package:flutter/material.dart';

class CheckPage extends StatefulWidget {
  const CheckPage({super.key});

  State<CheckPage> createState() => _CheckPageState();
}


class _CheckPageState extends State<CheckPage>{

  List<bool> _isSelected =[true,false,false];
  var _elevatedButtonColor = Colors.white;
  // var _checkIcon = Icon(Icons.circle_outlined,color: Colors.black);
  List<bool> _checkIcon = [false,false,false,false,false];
  // var _checkIcon = true;

  final List<String> _checkdata = ["Turn on oven","Turn on Deep Fat fryer","Turn on Bain Marie","setup workstations", "Food preparations areas are clean"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: Icon(
          Icons.arrow_back, 
        )
      ),
      body: Container(
        alignment: Alignment(0,-1),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
            children: [Text("Opening Check", style: TextStyle(fontSize:25, fontWeight:FontWeight.w800)),]
            ),
            SizedBox(height:20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(40),
                ),
                width: 300,
                height:50,
                child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                    Icon(Icons.calendar_month,color:Colors.grey),
                  SizedBox(width:10),
                  Text("DATE & TIME",style: TextStyle(fontWeight: FontWeight.w800)),
                  SizedBox(width: 10), 
                  Container(
                    width: 2,
                    height: 80,
                    color: Colors.grey,
                  ),
                  SizedBox(width: 10), 
                  Text("07-10-2024,12:31 PM")
                ],
            ))
            ]),
            SizedBox(height:20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [Container(
              // children: [
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                color: Colors.teal,
                ),
                borderRadius: BorderRadius.circular(40),
              ),
                child: ToggleButtons(borderRadius: BorderRadius.circular(40),
                constraints: BoxConstraints(minWidth: 120),
                isSelected: _isSelected,
                fillColor: Colors.white,
                borderColor: Colors.white,  
                selectedColor: Colors.white,
                splashColor: Colors.white,
                selectedBorderColor: Colors.white,
              onPressed: (e) => {setState(() {
                if(e == 0){
                  _isSelected[0] = true;
                  _isSelected[1] = false;
                  _isSelected[2] = false;
                }
                else if(e==1){
                  _isSelected[0] = false;
                  _isSelected[1] = true;
                  _isSelected[2] = false;
                }
                else if(e==2){
                  _isSelected[0] = false;
                  _isSelected[1] = false;
                  _isSelected[2] = true;
                }
              })},
              children: [
                Container(decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(36),
                color: _isSelected[0]?Colors.teal:Colors.white,                
              ),width: 120,height: 50, child: Center(child: Text("CHECK",style: TextStyle(color: _isSelected[0]?Colors.white:Colors.black)))), 
              Container(decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(36),
                color: _isSelected[1]?Colors.teal:Colors.white,
                
              ),width: 120,height: 50,child: Center(child: Text("FRIDGES",style: TextStyle(color: _isSelected[1]?Colors.white:Colors.black)))), 
              Container(decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(36),
                color: _isSelected[2]?Colors.teal:Colors.white,
                
              ),width: 120,height: 50,child: Center(child: Text("FREEZERS",style: TextStyle(color: _isSelected[2]?Colors.white:Colors.black))))],
              ),
            ),
              ]
          ),
          SizedBox(height: 10),
          Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(left:22.0),
                  child: ElevatedButton(
                    onPressed: () => {setState(() {
                      _elevatedButtonColor = _elevatedButtonColor == Colors.white? Colors.teal:Colors.white;
                    })},
                    style: ElevatedButton.styleFrom(backgroundColor: _elevatedButtonColor),
                      child: Text("MARK ALL AS DONE", style: TextStyle(color: _elevatedButtonColor == Colors.white?Colors.black:Colors.white))),
                )
              ],
            ),
          SizedBox(height:20),
          Column(
            
           children: [
            if(_isSelected[0])Column(
                children: [for(int i = 0;i<_checkdata.length;i++) Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(left:22.0,right: 22.0),
                  child: Container(
                    // height: 50,
                  key: UniqueKey(),
                    constraints: BoxConstraints(minWidth: 300,minHeight: 70),
                    decoration: BoxDecoration(
                      border: Border.all(width: 1,color: Colors.grey.shade300),
                      ),
                      child: Row(
                       
                        children: [
                          SizedBox(width:10),
                          SizedBox(
                            height:20,
                            width:20,
                            child:ElevatedButton(
                              onPressed: (
                                () => {
                                  setState(() => {
                                    print("Inside the setState function"),
                                    print(_checkdata[i]),
                                    _checkIcon[i] = !_checkIcon[i],
                                    // Icons.check_circle_rounded,color
                                  })
                                }
                                ),
                            style: ElevatedButton.styleFrom(
                              elevation: 0,
                              padding: EdgeInsets.zero, 
                              backgroundColor: Colors.transparent, 
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.zero, 
                              ),
                              side: BorderSide.none, 
                            ),
                          child: Icon(_checkIcon[i]?Icons.circle_outlined:Icons.check_circle_rounded,color:_checkIcon[i]?Colors.black:Colors.green),
                          )
                          ),



                          // Icon(Icons.circle_outlined,color: Colors.black),
                          SizedBox(width: 15),
                          Text(_checkdata[i],style: TextStyle(color: Colors.grey,fontSize: 14)),
                          // SizedBox(width:50),
                          Spacer(),
                          Padding(
                              padding: EdgeInsets.only(right: 10.0),
                              child: SizedBox(
                            height:20,
                            width:20,

                              child: ElevatedButton(
                              onPressed: (() => print("I am pressed")),
                              style: ElevatedButton.styleFrom(
                                elevation: 0,
                                padding: EdgeInsets.zero,
                                backgroundColor: Colors.transparent,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.zero,
                                ),
                                side: BorderSide.none,
                              ),
                              child: Icon(Icons.cancel_outlined,color: Colors.grey),
                            )
                            
                          ),
                          ),
                          
                          
                        ]
                      )
                      
                      )
                  ),
                SizedBox(height:10),
              ],
            )]
            ),
           ],
          
          ),
          
          ]
        ) 
      )
    );
  }
}
