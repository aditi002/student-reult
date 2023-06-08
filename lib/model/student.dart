class Student {
  String fname;
  String lname;
  Module module;
  int marks;

  Student({
    required this.fname,
    required this.lname,
    required this.module,
    required this.marks,
  });

  int getTotal() {
    int totalMarks = 0;
    if (module.moduleName == "Mobile Application Development") {
      totalMarks = marks + 100;
    } else if (module.moduleName == "Web API Development") {
      totalMarks = marks + 200;
    } else if (module.moduleName == "Design Thinking and Innovation") {
      totalMarks = marks + 300;
    } else if (module.moduleName == "Individual Project Preparation") {
      totalMarks = marks + 400;
    }
    return totalMarks;
  }

  String getResult() {
    if (marks > 60) {
      return 'Pass (1st)';
    } else if (marks >= 50 && marks <= 59) {
      return 'Pass (2nd)';
    } else if (marks >= 40 && marks <= 49) {
      return 'Pass (3rd)';
    } else {
      return 'Fail';
    }
  }
}

class Module {
  String moduleName;

  Module({required this.moduleName});
}
