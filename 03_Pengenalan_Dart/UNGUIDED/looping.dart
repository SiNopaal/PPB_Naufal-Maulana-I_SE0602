import 'dart:io';

void main() {
  stdout.write('Masukkan jumlah baris piramida: ');
  int baris = int.parse(stdin.readLineSync()!);

  for (int i = 1; i <= baris; i++) {
    for (int j = i; j < baris; j++) {
      stdout.write(' ');
    }

    for (int k = 1; k <= (2 * i - 1); k++) {
      stdout.write('*');
    }

    print('');
  }
}