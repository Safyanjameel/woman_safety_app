import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class SafeWebview extends StatelessWidget {
//  const SafeWebview({Key? key}) : super(key: key);
  final String? url;
  SafeWebview({this.url});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: WebView(
        initialUrl: url,
      ),
    );
  }
}
