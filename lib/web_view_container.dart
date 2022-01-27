import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewContainer extends StatefulWidget {
  final url;
  WebViewContainer(this.url);
  @override
  createState() => _WebViewContainerState(this.url);
}
class _WebViewContainerState extends State<WebViewContainer> {
  var _url;
  _WebViewContainerState(this._url);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Builder(builder: (BuildContext context) {
              return WebView(
                initialUrl: _url,
                javascriptMode: JavascriptMode.unrestricted,
                navigationDelegate: (NavigationRequest request) {
                  print('allowing navigation to $request');
                  return NavigationDecision.navigate;
                },
                onPageStarted: (String url) {
                  print('Page started loading: $url');
                },
                onPageFinished: (String url) {
                  print('Page finished loading: $url');
                },
                gestureNavigationEnabled: true,
              );
            })
        )
    );
  }

}
