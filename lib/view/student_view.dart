import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_state_management/model/student.dart';
import 'package:riverpod_state_management/view_model/student_viewmodel.dart';

class StudentView extends ConsumerStatefulWidget {
  const StudentView({Key? key}) : super(key: key);

  @override
  _StudentViewState createState() => _StudentViewState();
}

class _StudentViewState extends ConsumerState<StudentView> {
  String? selectedModule;
  List<String> modules = [
    "Mobile Application Development",
    "Web API Development",
    "Design Thinking and Innovation",
    "Individual Project Preparation",
  ];

  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final markController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var studentState = ref.watch(studentViewModelProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Student"),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 255, 0, 174),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            children: [
              const SizedBox(height: 20),
              TextFormField(
                controller: firstNameController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "First name",
                ),
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: lastNameController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Last name",
                ),
              ),
              const SizedBox(height: 20),
              DropdownButtonFormField(
                decoration: const InputDecoration(
                  labelText: 'Select Module',
                  border: OutlineInputBorder(),
                ),
                items: modules
                    .map(
                      (module) => DropdownMenuItem(
                        value: module,
                        child: Text(module),
                      ),
                    )
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    selectedModule = value as String?;
                  });
                },
              ),
              const SizedBox(height: 20),
              TextField(
                controller: markController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Marks",
                ),
              ),
              const SizedBox(height: 40),
              ElevatedButton(
                onPressed: () {
                  if (selectedModule != null) {
                    Student student = Student(
                      fname: firstNameController.text.trim(),
                      lname: lastNameController.text.trim(),
                      module: Module(moduleName: selectedModule!),
                      marks: int.tryParse(markController.text.trim()) ?? 0,
                    );

                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Student added successfully"),
                        backgroundColor: Color.fromARGB(255, 156, 33, 26),
                      ),
                    );

                    ref.read(studentViewModelProvider.notifier).addStudent(student);
                  }
                },
                child: const Text("ADD"),
              ),
              if (studentState.students.isNotEmpty)
                const Text("data")
              else
                const Text("no data"),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/studentresult');
                  },
                  child: const Text('View result'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    markController.dispose();
    super.dispose();
  }
}

