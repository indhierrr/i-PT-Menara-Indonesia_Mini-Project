// To parse this JSON data, do
//
//     final mahasiswa = mahasiswaFromJson(jsonString);

import 'dart:convert';

Mahasiswa mahasiswaFromJson(String str) => Mahasiswa.fromJson(json.decode(str));

String mahasiswaToJson(Mahasiswa data) => json.encode(data.toJson());

class Mahasiswa {
    Mahasiswa({
        required this.nama,
    });

    String nama;

    factory Mahasiswa.fromJson(Map<String, dynamic> json) => Mahasiswa(
        nama: json["nama"],);

    Map<String, dynamic> toJson() => {
        "nama": nama,
    };
}
