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

  // Function
  print('Function');

  hitungNilai();
  hitungNilai1(75, 90);
  var p = hitungNilai1(2, 50);
  print(p);
  var n = hitungNilai2(mapel1: 50, mapel2: 2);
  print(n);
  var o = hitungNilai3(79, 100);

   // final keyword => imutable / tidak bisa dirubah
  // const & final
  // const
  // const String mahasiswa ="beben";
  // final
  final String mahasiswafk;

  mahasiswafk = "beben";
  // mahasiswafk = "cecen";

  print(mahasiswafk);

  
  // null safety
  // ? ! late
  // ? digunakan dia boleh null
  String? jurusanns;

  // untuk di isi nanti
  // late String jurusanns;

  jurusanns = "teknik Informatika";
  // jurusanns = "TI";
  // ! memaksa untuk di jalakan atau yakin ada datanya
  print(jurusanns.length);

}

// Function
hitungNilai() {
  print("Hitung nilai");
}

// Potitional argument
// optional parameter tambah kurung []
hitungNilai1(mapel1, mapel2, [mapel3]) {
  var nilaiAkhir;
  if (mapel3 != null) {
    nilaiAkhir = mapel1 / mapel2 + mapel3;
  } else {
    nilaiAkhir = mapel1 / mapel2;
  }

  return nilaiAkhir;
}

// name argument
// name argument parameter optional
hitungNilai2({mapel1, mapel2}) {
  var nilaiAkhir;
  if (mapel2 != null) {
    nilaiAkhir = mapel1 / mapel2;
  } else {
    nilaiAkhir = mapel1;
  }
  return nilaiAkhir;
}

// void
void hitungNilai3(mapel1, mapel2) {
  var nilaiAkhir = mapel1 + mapel2;
  print(nilaiAkhir);
}
