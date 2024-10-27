import 'dart:ffi';

import 'package:flutter/material.dart';

class CheckPage extends StatefulWidget {
  const CheckPage({super.key});

  State<CheckPage> createState() => _CheckPageState();
}


class _CheckPageState extends State<CheckPage>{

  List<bool> _isSelected =[true,false,false];
  var _elevatedButtonColor = Colors.white;
  List<bool> _checkIcon = [false,false,false,false,false];
  var counter1 = 0;
  var counter2 = 0;
  // var _checkIcon = true;

  final List<String> _checkdata = ["Turn on oven","Turn on Deep Fat fryer","Turn on Bain Marie","setup workstations", "Food preparations areas are clean"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () => {
            Navigator.pop(context),
          },
            icon: Icon(Icons.arrow_back)
        )
        // Icon(
        //   Icons.arrow_back, 
        // )
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
                Container(
                  decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(36),
                color: _isSelected[0]?Colors.teal:Colors.white,                
              ),width: 120,height: 50, child: Center(child: Text("CHECK",style: TextStyle(color: _isSelected[0]?Colors.white:Colors.black)))), 
              Container(
                
                decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(36),
                color: _isSelected[1]?Colors.teal:Colors.white,
                
              ),width: 120,height: 50,child: Center(child: Text("FRIDGES",style: TextStyle(color: _isSelected[1]?Colors.white:Colors.black)))), 
              Container(
                
                decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(36),
                color: _isSelected[2]?Colors.teal:Colors.white,
                
              ),
              width: 120,height: 50,
              child: Center(child: Text("FREEZERS",style: TextStyle(color: _isSelected[2]?Colors.white:Colors.black))))
              ],
              ),
            ),
              ]
          ),
          SizedBox(height: 10),
     
          
          Column(
            
           children: [
            if(_isSelected[0])Column(
                     
                children: [
                  Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(left:22.0),
                  child: ElevatedButton(
                    onPressed: () => {setState(() {
                      _elevatedButtonColor = _elevatedButtonColor == Colors.white? Colors.teal:Colors.white;
                        for(var i=0;i<_checkIcon.length;i++){
                          if(_elevatedButtonColor == Colors.teal){
                          if(_checkIcon[i] == false){
                            _checkIcon[i] = true;
                          }
                          }else{
                            if(_checkIcon[i] == true){
                              _checkIcon[i] = false;
                            }
                          }
                        }
                      
                      
                    })},
                    style: ElevatedButton.styleFrom(backgroundColor: _elevatedButtonColor),
                      child: Text("MARK ALL AS DONE", style: TextStyle(color: _elevatedButtonColor == Colors.white?Colors.black:Colors.white))),
                )
              ],
            ),
            SizedBox(height:20),
            for(int i = 0;i<_checkdata.length;i++) Column(
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
                            child:IconButton(
                              onPressed: (
                                () => {
                                  setState(() => {
                                    _checkIcon[i] = !_checkIcon[i],
                                  })
                                }
                                ),
                          icon: Icon(_checkIcon[i]?Icons.check_circle_rounded:Icons.circle_outlined,color:_checkIcon[i]?Colors.green:Colors.black),
                          )
                          ),

                          SizedBox(width: 5),
                          Text(_checkdata[i],style: TextStyle(color: Colors.grey,fontSize: 14)),
                          // SizedBox(width:50),
                          Spacer(),
                          Padding(
                              padding: EdgeInsets.only(right: 10.0),
                              child: SizedBox(
                              child: IconButton(
                              onPressed: (() => print("I am pressed")),
                              icon: Icon(Icons.cancel_outlined,color: Colors.grey),
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
            )else if(_isSelected[1]) Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 10.0,right:10.0),
                  child: Container(
                    constraints: BoxConstraints(minHeight: 130),
                    decoration: BoxDecoration(
                      border: Border.all(width: 1,color: Colors.grey.shade300),
                    ),
                    child: Column(
                      children: [
                          // mainAxisAlignment: MainAxisAlignment.start, 
                            Padding(padding: EdgeInsets.all(5),
                              child: Row(
                                    children: [
                                        const Icon(Icons.kitchen , color: Colors.yellow,size: 30),
                                        SizedBox(width:10),
                            const Text(
                              'Fridge 1',
                                style: TextStyle(
                                fontSize: 19,
                                // fontWeight: FontWeight.bold,
                                color: Colors.grey,
                              ),
                            ),
                            Spacer(),
                            Text('$counter1'),
                            IconButton(
                              icon: const Icon(Icons.arrow_circle_up,color:Colors.grey),
                              onPressed: () => {
                                setState(() => {
                                      counter1++,
                                })
                              } ,
                            ),
                                    ],
                              ),  
                        ),
                        // const SizedBox(height: 10),
                        Padding(
                          padding: EdgeInsets.only(left:10.0,right:10.0),
                          child: TextField(
                          decoration: InputDecoration(
                            filled: true, 
                          fillColor: Colors.grey[200],
                            hintText: 'Enter your comment here',
                            border: const OutlineInputBorder(),
                            
                          ),
                        ),
                        ),
                        
                      ],
                      )
                  )
                  ),
                  const SizedBox(height: 16),
                  Padding(
                    padding: EdgeInsets.only(left:15.0),
                    child: ElevatedButton(
                    
                    onPressed: () {},
                    child: const Text('Leave a comment',style: TextStyle(color: Colors.white),),
                    style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.teal,
                  ),
             
          ),
                  ),
                  
              ],

            )else if(_isSelected[2]) Column(
              crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                      Padding(
                        padding: EdgeInsets.only(left:10.0,right:10.0),
                        child: Column(
                           crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                                constraints: BoxConstraints(minHeight: 75),
                                decoration: BoxDecoration(
                                  border: Border.all(width: 1,color: Colors.grey.shade300),
                                ),
                                child: Row(
                                children: [
                                  Icon(Icons.kitchen,color: Colors.yellow,size:40),
                                  SizedBox(width:10),
                                  Text("Freezer 1",style: TextStyle(color: Colors.grey,fontSize: 18)),
                                  Spacer(),
                                  Text('$counter2'),
                                  IconButton(icon: Icon(
                                    Icons.arrow_drop_down_circle),
                                    onPressed: () => {
                                      setState(() => {
                                        counter2--,
                                      })
                                    },
                                    )
                              ],
                          )
                        ),
                        SizedBox(height:15),
                        Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                            Text("Leave a Comment",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 20)),
                            Container(
                              decoration: BoxDecoration(
                                border: Border.all(width: 1,color:const Color.fromARGB(255, 192, 189, 189)),
                              ),
                            )
                          ],),
                        ),
                        ],)
                      )
                  ],
            ),
           ],
          
          ),
          
          ]
        ) 
      )
    );
  }
}
