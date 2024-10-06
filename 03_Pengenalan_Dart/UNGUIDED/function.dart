import 'dart:io';

void main() {
  print('Masukkan bilangan bulat:');
  int? bilangan = int.parse(stdin.readLineSync()!); 

  if (cekPrima(bilangan)) {
    print('$bilangan adalah bilangan prima');
  } else {
    print('$bilangan bukan bilangan prima');
  }
}

bool cekPrima(int bilangan) {
  if (bilangan <= 1) {
    return false; 
  }

  for (int i = 2; i <= bilangan ~/ 2; i++) {
    if (bilangan % i == 0) {
      return false; 
    }
  }

  return true; 
}