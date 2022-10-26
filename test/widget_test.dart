// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_pertama/main.dart';

void main() {
  // tipe data dan variable

  var mahasiswa = "Jejen";
  var umur = 20;

  print(mahasiswa + " Umur = " + umur.toString());

  // String
  String mahasiswaString;
  mahasiswaString = "Aan";

  print(mahasiswaString);

  // int
  int semestester;
  semestester = 6;

  print(semestester);

  // double
  double ipk;
  ipk = 3;

  print(ipk);

  // boolean
  bool benar = true;
  bool salah = false;
  bool tidakbenar = !true;
  bool tidaksalah = !false;

  // list
  List<String> jurusan = [
    "Teknik Informatika",
    "Sistem Informasi",
    "DKV",
    semestester.toString(),
    ipk.toString()
  ];

  print(jurusan);

  // map
  Map<String, dynamic> kelas = {
    "nama": "beben",
    "kelas": "TI 3",
  };
  print(kelas);
  print(kelas['nama']);
  print(kelas['kelas']);

  // Operator
  int a, b;
  a = 9;
  b = 7;
  print("a = " + a.toString());
  print("b = " + b.toString());

  print(a + b);
  print(a - b);
  print(a / b);
  print(a * b);
  print(a > b);
  print(a < b);
  print(a >= b);
  print(a <= b);

  //  conditional
  print("Conditional");
  var nilai;
  nilai = 80;

  if (nilai >= 80) {
    print("A");
  } else if (nilai <= 80 && nilai >= 50) {
    print("B");
  } else {
    print("Tidak Lulus");
  }

  print("----------");
  nilai >= 80 ? print("A") : print("Tidak A");
}
