import 'package:url_launcher/url_launcher.dart';



launchURL(url) async {
  // const url = 'snssdk1128:';
  // const url = 'snssdk1128://user/profile/88486395468';

  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}