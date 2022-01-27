import 'package:flutter/material.dart';
import 'web_view_container.dart';

class Home extends StatelessWidget {
  final _links = [
    'https://cfd2.staging.sgmarkets.com/fortune-web-server/static/fortune-login/index.html',
    'https://cfd2.staging.sgmarkets.com/fortune-web-server/static/fortune-login/mobilelogin.html',
    'https://accounts.google.com/signin/v2/identifier?flowName=GlifWebSignIn&flowEntry=ServiceLogin',
    'https://cfdapp.comdirect.de/lp/cfdapp/login'
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: _links.map((link) => _urlButton(context, link)).toList(),
                ))));
  }
  Widget _urlButton(BuildContext context, String url) {
    return Container(
        padding: EdgeInsets.all(20.0),
        child: FlatButton(
          color: Theme.of(context).primaryColor,
          padding: const EdgeInsets.symmetric(horizontal: 50.0, vertical: 15.0),
          child: Text(url),
          onPressed: () => _handleURLButtonPress(context, url),
        ));
  }
  void _handleURLButtonPress(BuildContext context, String url) {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => WebViewContainer(url)));
  }
}
