import 'package:flutter/material.dart';

class CheckPage extends StatelessWidget {
  const CheckPage({super.key});

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
                // padding: EdgeInsets.symmetric(vertical: 20,horizontal: 30),
              //  padding:EdgeInsets.all(0.0),
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
              children: [ToggleButtons(borderRadius: BorderRadius.circular(40),children: [Container(child: Text("Hello World")), Container(child: Text("Hello1")), Container(child: Text("Hello2"))],isSelected: [true,false,false],)],

            ),
          ],
        )
        //child: const Text("Opening Check", style: TextStyle(fontSize:25, fontWeight:FontWeight.w800)),
        
      )
    );
  }
  
}