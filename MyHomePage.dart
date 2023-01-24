import 'package:flutter/material.dart';
import 'package:miniproject/menu.dart';
import 'package:miniproject/service/mahasiswaservice.dart';

import 'model/mahasiswa.dart';

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late Future data;
  List<Mahasiswa> data2 = [];

  @override
  void initState() {
    data = mahasiswaservice().getmahasiswa();
    data.then((value) {
      setState(() {
        data2 = value;
      });
    });
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          title: RichText(
            text: TextSpan(
              text: "PROFILE",
              style: TextStyle(
                  fontSize: 18,
                  color: Color(0xff293535),
                  fontWeight: FontWeight.bold),
            ),
          ),
          backgroundColor: Colors.white,
          leading: GestureDetector(
            child: Icon(
              Icons.arrow_back_ios,
              color: Color(0xff293535),
            ),
            onTap: () {
              Navigator.push(
                  context,
                  // DetailPage adalah halaman yang dituju
                  MaterialPageRoute(builder: (context) => Menu()));
            },
          )),
      body: data2.length == 0
          ? Center(
              child: CircularProgressIndicator(color: Colors.black),
            )
          : ListView.builder(
              itemCount: data2.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(data2[index].nama),
                );
              },
            ),
    );
  }
}
