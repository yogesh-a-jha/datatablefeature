import 'package:flutter/material.dart';
import 'add_student_page.dart';
import 'student.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Class Attendance Tracker',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: StudentListPage(),
    );
  }
}

class StudentListPage extends StatefulWidget {
  @override
  _StudentListPageState createState() => _StudentListPageState();
}

class _StudentListPageState extends State<StudentListPage> {
  // List of students to display
  List<Student> students = [];

  // Function to add student to the list
  void addStudent(Student student) {
    setState(() {
      students.add(student);
    });
  }

  // Function to delete student from the list
  void deleteStudent(int index) {
    setState(() {
      students.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Student List'),backgroundColor: Colors.blue,),
      body: students.isEmpty
          ? Center(child: Text('No students added yet'))
          : ListView.builder(
              itemCount: students.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text('${students[index].name} - ${students[index].rollNumber}'),
                  trailing: IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () => deleteStudent(index),
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          // Navigate to Add Student page and pass callback function
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddStudentPage(onStudentAdded: addStudent),
            ),
          );
        },
      ),
      backgroundColor: const Color.fromARGB(255, 84, 170, 240),
    );
  }
}
