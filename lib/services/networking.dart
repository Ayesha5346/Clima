import 'package:http/http.dart' as http;
import 'dart:convert';

class networkHelper {
  final url ;
  networkHelper(this.url);

  Future getData()async{
    http.Response response = await http.get(url);
    if(response.statusCode==200)
    {
      String Data = response.body;
      var decodeData = jsonDecode(Data);
      return decodeData;
    }
    else
     {
       print(response.statusCode);
     }

  }

}