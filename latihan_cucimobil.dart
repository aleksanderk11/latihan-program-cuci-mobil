import 'dart:io';

void main() {
  var jalan = true;
List waitinglist=[];
// List<String>waitinglist = [];

Map posA = {'plat' : null};
Map posB = {'plat' : null};
Map posC = {'plat' : null};

  tambahlist(){
    print('Daftar Pos Pencucian');
    stdout.write('Masukkan Plat Kendaraan : ');
    var plat = (stdin.readLineSync()!);
    
    if (posA['plat'] == null) {
      posA['plat'] = plat;
    } 
else if (posB['plat'] == null) {
      posB['plat'] = plat;
    } else if (posC['plat'] == null) {
      posC['plat'] = plat;
    } else {
      waitinglist.add(plat);
    }

    
     // jika ketiga pos lagi kosong maka masuk dulu, jika sebuah post penuh maka akan ke waiting list
  }
  showlist(){
    // perulangan pada list for, for in, foreach
    print('Daftar Waiting List');
    for (var i = 0; i < waitinglist.length; i++) {
      print('${i + 1}. ${waitinglist[i]}');
    }
    
  }
  showpos(){
    // tampil A, B, C
    
      print('Pos A : ${posA['plat'] ?? ''}');
      print('Pos B : ${posB['plat'] ?? ''}'); // tambahkan ?? '' untuk menghilangkan null jika tidak ada isi di dalam pos
      print('Pos C : ${posC['plat'] ?? ''}');
      
    
  }
  finishpos(){
    stdout.write('Masukkan Pos yang selesai (A / B / C): ');
    var pos = stdin.readLineSync()!;

    if (pos == 'A' ) {
      posA['plat'] = null;
    } else if (pos == 'B') {
      posB['plat'] = null;
    } else if (pos == 'C') {
      posC['plat'] = null;
    } else {
      print('Harap Masukkan Sesuai Dengan Abjad Kapital!');
    }

    if (waitinglist.isNotEmpty) {
      if (pos == 'A') {
      posA['plat'] = waitinglist[0];
      waitinglist.removeAt(0);
    } else if (pos == 'B') {
      posB['plat'] = waitinglist[0];
      waitinglist.removeAt(0);
    } else if (pos == 'C') {
      posC['plat'] = waitinglist[0];
      waitinglist.removeAt(0);
    }
    // waitinglist.removeAt(0); - Kalau dibawah ketika langsung enter maka akan tetap hilang / di remove
    }

    // tanya user, hapus pos berapa?
    // jika pos a dihapus,
    // maka pos a jadikan nul, pos a diisi dengan list pertama, list pertama di hapus jika pos B dihapus
    // maka pos b jadikan nul, pos b diisi dengan list pertama, list pertama di hapus jika pos c dihapus
    // maka pos c jadikan nul, pos c diisi dengan list pertama, list pertama di hapus

  }

  keluar(){
    exit(0);
  }

  while(jalan == true) {
    print('=======================================');
    print('SISTEM ANTRIAN CUCI MOBIL');
    print('=======================================');
    print('1. Tambah Waiting List');
    print('2. Lihat Waiting List');
    print('3. Lihat Pos');
    print('4. Selesaikan Pos');
    print('5. Keluar dari Sistem');

    stdout.write('Pilih Menu antara (1/2/3/4/5)! \n');
    int pilihan = int.parse(stdin.readLineSync()!);
    switch (pilihan) {
      case 1 :
      tambahlist();
      case 2:
      showlist();
      case 3:
      showpos();
      case 4:
      finishpos();
      case 5 :
      keluar();
    }

    // tampil menu dulu
    // tanya user pilih menu mana
    // switch case
    // case 1 > tampilmenu
    // case 2 > lihat waiting list
    // case 3 > lihat pos
    // case 4 > selesaikan pos
    // case 5 > keluar dari aplikasi

  }
}