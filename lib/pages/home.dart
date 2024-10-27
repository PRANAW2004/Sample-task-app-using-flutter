import 'package:flutter/material.dart';

import './check.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
          leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.menu,color: Colors.white),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
        title: const Text( 
          'Leaf Hotel Dover',
          style: TextStyle(color: Colors.white),
        ),
  //========================================================================
         backgroundColor: Colors.teal,

      ),
      drawer: Drawer(
          backgroundColor: Colors.teal,
           child: ListView(
            padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(
                color: Colors.teal,
                
              ),
              child: Column( 

                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const   Text(
                    'leaf hotel dover',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                  const Text(
                    'Welcome KL Admin',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                    ),
                  ),
                  DropdownButton<String>(
                    dropdownColor: Colors.teal,
                    value: '  Leaf Hotel Dover    ',
                     icon: Icon(Icons.arrow_downward, color: Colors.white),
                   
                    iconSize: 24,
                    elevation: 16,
                    menuWidth: 300,
              
                    style: const TextStyle(color: Colors.white),
                    
                   
                    onChanged: (String? newValue) 
                    {
                     
                    },
                    items: <String>['  Leaf Hotel Dover    ', 'Option 2', 'Option 3']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value ,style:TextStyle(color: Colors.white),),
                      );
                    }).toList(),
                  ),
                ],
              ),
            ),
            Center(
              child: ListTile(
                leading: const Icon(Icons.dashboard),
                title: const Text('Dashboard', style: TextStyle(color: Colors.white),),
                onTap: () {
                  
                },
              ),
            ),
            Center(
              child: ListTile(
                leading: const Icon(Icons.location_on),
                title: const Text('Location Checks', style: TextStyle(color: Colors.white),),
                onTap: () {
                 
                },
              ),
            ),
            Center(
              child: ListTile(
                leading: const Icon(Icons.report),
                title: const Text('Reports', style: TextStyle(color: Colors.white),),
                onTap: () {
                  
                },
              ),
            ),
            Center(
              child: ListTile(
                leading: const Icon(Icons.folder),
                title: const Text('Records', style: TextStyle(color: Colors.white),),
                onTap: () {
                
                },
              ),
            ),
            Center(
              child: ListTile(
                leading: const Icon(Icons.settings),
                title: const Text('Settings', style: TextStyle(color: Colors.white),),
                onTap: () {
                 
                },
              ),
            ),
            Center(
              child: ListTile(
                leading: const Icon(Icons.share),
                title: const Text('Refer a friend', style: TextStyle(color: Colors.white),),
                onTap: () {
                 
                },
              ),
            )
          ]
          )
    ),
    body: Container(
      child: ElevatedButton(
        onPressed: () => {
          Navigator.push(context, MaterialPageRoute(builder: (context) => CheckPage(),))
        },
        child: Text("CLICK ME"),
      )
    )
    );
  }
}