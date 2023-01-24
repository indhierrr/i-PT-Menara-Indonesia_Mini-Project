import 'package:miniproject/model/mahasiswa.dart';
import 'package:http/http.dart' as http;

class mahasiswaservice {
  static final String _baseUrl = 'https://app-univ.herokuapp.com/api/mahasiswa';

  Future getmahasiswa() async {
    Uri urlApi = Uri.parse(_baseUrl);
    final response = await http.get(urlApi);
    if (response.statusCode == 200) {
      return mahasiswaFromJson(response.body.toString());
    } else {
      throw Exception("Failed to load data mahasiswa");
    }
  }
}
