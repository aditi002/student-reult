import '../model/student.dart';

class StudentState {
  List<Student> students;

  StudentState({
    required this.students,
  });


  //initial state
  StudentState.initial() : this (students: []);

  //copywith
  StudentState copyWith({
    bool? isLoading,
    List<Student>? students,
  }) {
    return StudentState(
        students: students ?? this.students);
  }


}