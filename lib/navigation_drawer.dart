import 'package:flutter/material.dart';
class navigationDrawer extends StatelessWidget {
  const navigationDrawer({super.key});

  MySnackbar(message,context){
    return ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(message)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text('Navigation Drawer '),
        centerTitle: true,
        backgroundColor: Colors.tealAccent,
        toolbarHeight: 65,
        actions: [
          IconButton(onPressed: (){MySnackbar('I am Email', context);}, icon:Icon(Icons.email)),
          IconButton(onPressed: (){MySnackbar('I am Search', context);}, icon:Icon(Icons.search)),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.amberAccent,
        currentIndex: 0, // Which one to be active
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home",),
          BottomNavigationBarItem(icon: Icon(Icons.contact_mail), label: "Contact",),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Sign In",),
        ],
        onTap: (int index){
          if (index == 0){
            MySnackbar("I am home", context);
          }
          if (index == 1){
            MySnackbar("I am Contact", context);
          }
          if (index == 2){
            MySnackbar("I am Sign", context);
          }
        },
      ),
      drawer: Drawer(
        child: ListView(
            children: [
              DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: 40,
                        backgroundImage: NetworkImage("https://smartcards.pro/NlVgNj"),
                      ),
                      SizedBox(height: 2),
                      Text(
                        'humayun1278@gmail.com',
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                      SizedBox(height: 2),
                      Text(
                        '+8801716205879',
                        style: TextStyle(color: Colors.white70, fontSize: 14),
                      ),
                    ],
                  ),
                ),
              ),
              ListTile(
                leading: Icon(Icons.home),
                title: Text("Home"),
                onTap: (){
                  MySnackbar("This Home snackbar", context);
                },
              ),

              ListTile(
                leading: Icon(Icons.contact_mail),
                  title: Text("Contact"),),
              Divider(
                thickness: 1,
                color: Colors.blue.shade200,
              ),
              ListTile(
                leading: Icon(Icons.phone),
                title: Text("Phone"),),
            ],
        ),
      ),
    );
  }
}