import 'package:flutter/material.dart';



class AlertDialogDemo extends StatefulWidget {
  const AlertDialogDemo({super.key});

  @override
  State<AlertDialogDemo> createState() => _AlertDialogDemoState();
}

class _AlertDialogDemoState extends State<AlertDialogDemo> {
  final TextEditingController _nameController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text('Header Part '),
        centerTitle: true,
        backgroundColor: Colors.tealAccent,
        toolbarHeight: 65,

      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => _showBasicAlert(context),
              child: const Text('Basic Alert by Hk'),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () => _showMultiButtonAlert(context),
              child: const Text('Multi-Button Alert'),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () => _showCustomizedAlert(context),
              child: const Text('Customized Alert'),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () => _showInputAlert(context),
              child: const Text('Alert with Input'),
            ),
          ],
        ),
      ),
    );
  }

  void _showBasicAlert(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Alert'),
          content: const Text('This is a basic alert dialog.'),
          actions: <Widget>[
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _showMultiButtonAlert(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Confirm'),
          content: const Text('Do you want to proceed?'),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                // Perform some action
                Navigator.of(context).pop();
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Action confirmed')),
                );
              },
            ),
          ],
        );
      },
    );
  }
  void _showCustomizedAlert(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text(
            'Warning',
            style: TextStyle(color: Colors.red),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: const [
              Icon(Icons.warning, color: Colors.amber, size: 50),
              SizedBox(height: 10),
              Text('This action cannot be undone!'),
            ],
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          actions: [
            TextButton(
              child: const Text('Cancel'),
              onPressed: () => Navigator.pop(context),
            ),
            ElevatedButton(
              child: const Text('Proceed'),
              onPressed: () {
                // Action
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Action performed')),
                );
              },
            ),
          ],
        );
      },
    );
  }

  void _showInputAlert(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Enter your name'),
          content: TextField(
            controller: _nameController,
            decoration: const InputDecoration(hintText: "Name"),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Submit'),
              onPressed: () {
                String name = _nameController.text;
                Navigator.of(context).pop();
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Hello, $name!')),
                );
                _nameController.clear();
              },
            ),
          ],
        );
      },
    );
  }
}