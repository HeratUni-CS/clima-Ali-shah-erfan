import 'package:http/http.dart'as http;
import 'dart:convert';
class NetworkHelper {
  NetworkHelper(this.url);
  final String url;

  Future getData() async{
     Response response = await http.get(url);
    if (response.StatusCode == 200) {
      String data = response.body;
    var decodedata = jsonDecode(data);
    return jsonDecode(data)
       } else{
      print(response.StatusCode);
    } 
  }
}