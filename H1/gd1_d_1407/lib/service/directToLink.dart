// import 'package:url_launcher/link.dart';
import 'package:url_launcher/url_launcher.dart';

class Direct {
  static launchThisURL(String urlToLaunch) async {
    final uri = Uri.parse(urlToLaunch);
    if (!await launchUrl(uri)) {
      throw Exception('Could not launch $urlToLaunch');
    }
  }
}
