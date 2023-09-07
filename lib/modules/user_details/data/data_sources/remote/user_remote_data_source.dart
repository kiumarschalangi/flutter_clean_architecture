import 'package:http/http.dart';

// class UserInfoApiController {
//   final Client _client = Client();

//   Future<void> getUserInfoFromApi(Uri url) async {
//     _client.get(url);
//   }
// }
class UserRemoteDataSource {
  final Client _client = Client();

  Future<void> getUserInfoFromApi(Uri url) async {
    _client.get(url);
  }
  // Implement methods for fetching user data from a remote API.
}
