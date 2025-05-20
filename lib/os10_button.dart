import 'package:flutter/material.dart';
class Os10Button extends StatelessWidget {
  const Os10Button({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

     // backgroundColor: Colors.brown[100],
      // Header Part
      appBar: AppBar(
      title:Text('Class Button Two'),
        centerTitle: true,
        backgroundColor: Colors.tealAccent,
      ),
      body:Center(
     child:Column(
        children: <Widget>[
          ElevatedButton(
              onPressed:(){print('Button');}, child: Text('Button Two A')),
          ElevatedButton(
              onPressed:(){print('Button');}, child: Text('Button')),
          SizedBox(
            width: 250,
            height: 60,
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
    );
  }

}
