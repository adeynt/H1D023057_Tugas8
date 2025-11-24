import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:tokokita/model/produk.dart';

class ProdukBloc {
  static const String baseUrl = "http://toko_api.test/produk";

  // GET List Produk
  static Future<List<Produk>> getProduk() async {
    final response = await http.get(Uri.parse(baseUrl));

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body)['data'];
      return jsonResponse.map((p) => Produk.fromJson(p)).toList();
    } else {
      throw Exception("Gagal load produk");
    }
  }

  // DELETE Produk
  static Future<bool> deleteProduk({required int id}) async {
    final response = await http.delete(Uri.parse("$baseUrl/$id"));

    if (response.statusCode == 200) {
      return true;
    } else {
      throw Exception("Gagal menghapus produk");
    }
  }
}
