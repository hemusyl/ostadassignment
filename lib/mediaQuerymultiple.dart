import 'package:flutter/material.dart';

MySnackbar(message,context){
  return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)));
}
class ResponsiveLayoutScreen extends StatelessWidget {
  // Sample data with network image URLs
  final List<Map<String, String>> containerData = [
    {
      'image': 'https://flagcdn.com/w320/bd.png', // Network image URL
      'title': 'Bangladesh',
      'text': 'Description for Country flag images',
    },
    {
      'image': 'https://flagcdn.com/w320/ar.png',
      'title': 'Argentina',
      'text': 'Description for Country flag images',
    },
    {
      'image': 'https://flagcdn.com/w320/jp.png',
      'title': 'Japan',
      'text': 'Description for Country flag images',
    },
    {
      'image': 'https://flagcdn.com/w320/my.png',
      'title': 'Malaysia',
      'text': 'Description for Country flag images',
    },
    {
      'image': 'https://flagcdn.com/w320/sg.png',
      'title': 'Singapur',
      'text': 'Description for Country flag images',
    },
    {
      'image': 'https://flagcdn.com/w320/tr.png',
      'title': 'Turky',
      'text': 'Description for Country flag images',
    },
    // Add more items if needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text('Responsive Flag '),
        centerTitle: true,
        backgroundColor: Colors.tealAccent,
        toolbarHeight: 65,

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

      body: LayoutBuilder(
        builder: (context, constraints) {
          double screenWidth = constraints.maxWidth;
          int crossAxisCount;

          if (screenWidth < 768) {
            crossAxisCount = 2;
          } else if (screenWidth >= 768 && screenWidth <= 1024) {
            crossAxisCount = 3;
          } else {
            crossAxisCount = 4;
          }

          return GridView.builder(
            padding: EdgeInsets.all(10),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: crossAxisCount,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              childAspectRatio: 0.8,
            ),
            itemCount: containerData.length,
            itemBuilder: (context, index) {
              return ContainerCard(
                imageUrl: containerData[index]['image']!,
                title: containerData[index]['title']!,
                text: containerData[index]['text']!,
              );
            },
          );
        },
      ),
    );
  }
}

class ContainerCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String text;

  const ContainerCard({
    required this.imageUrl,
    required this.title,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 3,
            child: ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(8)),
              child: Image.network(
                imageUrl,
                fit: BoxFit.cover,
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) return child;
                  return Center(
                    child: CircularProgressIndicator(
                      value: loadingProgress.expectedTotalBytes != null
                          ? loadingProgress.cumulativeBytesLoaded /
                          loadingProgress.expectedTotalBytes!
                          : null,
                    ),
                  );
                },
                errorBuilder: (context, error, stackTrace) =>
                    Container(
                      color: Colors.grey[300],
                      child: Icon(Icons.broken_image, size: 50),
                    ),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Padding(
              padding: EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    text,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[600],
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}