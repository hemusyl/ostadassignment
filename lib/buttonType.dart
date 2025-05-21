import 'package:flutter/material.dart';
class buttonType extends StatelessWidget {
  const buttonType({super.key});
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
      body: SingleChildScrollView(
       child:  Wrap(
        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
         children: [
               TextButton(onPressed: (){}, child: Text('Text Button')),
               ElevatedButton(
                   style: ElevatedButton.styleFrom(
                     backgroundColor: Colors.green,
                     foregroundColor: Colors.white,
                     padding: EdgeInsets.all(15),
                     shape: RoundedRectangleBorder(
                       borderRadius: BorderRadius.circular(5),
                     ),
                     textStyle: TextStyle
                       (fontSize: 22.0,
                       fontWeight: FontWeight.bold,
                     ),
                   ),
                   onPressed: (){},
                   child: Text('ElevatedButton H')),
               OutlinedButton(onPressed: (){}, child: Text('Outline Button')),
           SizedBox(
             child: ElevatedButton(
                 style: ElevatedButton.styleFrom(
                   backgroundColor: Colors.green,
                   foregroundColor: Colors.white,
                   textStyle: TextStyle
                     (fontSize: 22.0,
                     fontWeight: FontWeight.bold,
                   ),
                 ),
                 onPressed:(){print('Button');},
                 child: Text('Button Two')),

           )
         ],
       ),
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
              padding: EdgeInsets.all(0),
              child: UserAccountsDrawerHeader(
                accountName: Text("Humayun Kabir"),
                accountEmail: Text("humayun1278@gmail.com"),
                currentAccountPicture:
                Image.network("https://smartcards.pro/NlVgNj"),
              ),
              decoration: BoxDecoration(
                color: Colors.cyanAccent,
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
            ListTile(
              leading: Icon(Icons.phone),
              title: Text("Phone"),),
          ],
        ),
      ),
    );
  }
}
