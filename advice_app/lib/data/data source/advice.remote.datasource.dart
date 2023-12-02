import 'dart:convert';
import 'package:advice_app/data/exception/exception.dart';
import 'package:http/http.dart' as http;
import 'package:advice_app/data/models/advice.model.dart';

//https://api.flutter-community.com/api/v1/advice


abstract class AdviceRemoteDataSource{
  /// requests  random advice from API
  /// returns [AdviceModel]
  /// throws a server-exception if status code is not 200
  Future <AdviceModel> getRandomAdviceFromApi();
}

class AdviceRemoteDataSourceImpl implements AdviceRemoteDataSource{
  final http.Client client;

  AdviceRemoteDataSourceImpl({required this.client});

  @override
  Future<AdviceModel> getRandomAdviceFromApi() async {
    final response = await client.get(Uri.parse('https://api.flutter-community.com/api/v1/advice'),
    headers: {
      'content-type':'application/json'
    });

    if(response.statusCode != 200){
      throw ServerException();
    }else{
      final responseBody = json.decode(response.body);
      return AdviceModel.fromJson(responseBody);
    }
  }

}
