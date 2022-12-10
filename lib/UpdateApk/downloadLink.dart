import 'package:http/http.dart' as http;

class DownloadLink {
  static Future<String?> getDownloadLink() async {
    final url = Uri.parse(
        "https://cybercrimesmm.github.io/SocialMediaMonitoring/DownloadApk.org");
    final response = await http.get(url);

    return response.statusCode == 200 ? response.body : null;
  }
}

// class ApkVersion {
//   static Future<String?> LatestApkVersion() async {
//     final url = Uri.parse(
//         "https://rporwal0007.github.io/userData/ApplicationVersion.org");
//     final response2 = await http.get(url);
//     return response2.statusCode == 200 ? response2.body : null;
//     // return response2.body;
//   }
// }
