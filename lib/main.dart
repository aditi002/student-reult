import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_state_management/view/result_view.dart';
import 'package:riverpod_state_management/view/student_view.dart';

void main() {
  runApp(
    ProviderScope(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Student Result',
        theme: ThemeData(primarySwatch: Colors.pink),
        initialRoute: '/',
        routes: {
          '/': (context) => const StudentView(),
          '/studentresult': (context) => const StudentResult(),
        },
      ),
    ),
  );
}