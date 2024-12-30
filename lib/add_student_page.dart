import 'package:flutter/material.dart';
import 'student.dart';

class AddStudentPage extends StatefulWidget {
  final Function(Student) onStudentAdded;

  AddStudentPage({required this.onStudentAdded});

  @override
  _AddStudentPageState createState() => _AddStudentPageState();
}

class _AddStudentPageState extends State<AddStudentPage> {
  final _nameController = TextEditingController();
  final _rollNumberController = TextEditingController();

  // Function to add a student to the list
  void addStudent() {
    final name = _nameController.text;
    final rollNumber = _rollNumberController.text;

    if (name.isNotEmpty && rollNumber.isNotEmpty) {
      final student = Student(name: name, rollNumber: rollNumber);
      widget.onStudentAdded(student);  // Pass the student back to the list screen
      Navigator.pop(context);  // Go back to the list screen
    } else {
      // Show a validation error if fields are empty
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please enter both name and roll number')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Add Student'),backgroundColor: Colors.blue,),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _nameController,
              decoration: InputDecoration(labelText: 'Student Name'),
            ),
            TextField(
              controller: _rollNumberController,
              decoration: InputDecoration(labelText: 'Roll Number'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: addStudent,
              child: Text('Add Student'),
            ),
          ],
        ),
      ),
    );
  }
}
