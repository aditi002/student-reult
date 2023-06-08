import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_state_management/view_model/student_viewmodel.dart';

class StudentResult extends ConsumerStatefulWidget {
  const StudentResult({Key? key}) : super(key: key);

  @override
  _StudentResultState createState() => _StudentResultState();
}

class _StudentResultState extends ConsumerState<StudentResult> {
  @override
  Widget build(BuildContext context) {
    var students = ref.watch(studentViewModelProvider).students;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Result"),
        backgroundColor: const Color.fromARGB(255, 255, 0, 174),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: SizedBox(
          child: DataTable(
            headingRowColor: MaterialStateColor.resolveWith(
              (states) => const Color.fromARGB(255, 139, 139, 139),
            ),
            border: TableBorder.all(color: Colors.black),
            columns: const [
              DataColumn(
                label: Expanded(
                  child: Text(
                    "First name",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color.fromARGB(255, 255, 255, 255),
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
              DataColumn(
                label: Expanded(
                  child: Text(
                    "Last name",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color.fromARGB(255, 255, 255, 255),
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
              DataColumn(
                label: Expanded(
                  child: Center(
                    child: Text(
                      "Module",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color.fromARGB(255, 255, 255, 255),
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ),
              DataColumn(
                label: Expanded(
                  child: Text(
                    "Marks",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color.fromARGB(255, 255, 255, 255),
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
              DataColumn(
                label: Expanded(
                  child: Text(
                    "Total",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color.fromARGB(255, 255, 255, 255),
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
              DataColumn(
                label: Expanded(
                  child: Text(
                    "Result",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color.fromARGB(255, 255, 255, 255),
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
            ],
            rows: students
                .map(
                  (student) => DataRow(
                    cells: [
                      DataCell(
                        Center(child: Text(student.fname)),
                      ),
                      DataCell(
                        Center(child: Text(student.lname)),
                      ),
                      DataCell(
                        Center(child: Text(student.module.moduleName)),
                      ),
                      DataCell(
                        Center(child: Text(student.marks.toString())),
                      ),
                      DataCell(
                        Center(child: Text(student.getTotal().toString())),
                      ),
                      DataCell(
                        Center(child: Text(student.getResult())),
                      ),
                    ],
                  ),
                )
                .toList(),
          ),
        ),
      ),
    );
  }
}
