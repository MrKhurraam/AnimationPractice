// import 'package:flutter/material.dart';
// import 'package:webview_flutter/webview_flutter.dart';
//
//
//
// class WebViewScreen extends StatefulWidget {
//   @override
//   _WebViewScreenState createState() => _WebViewScreenState();
// }
//
// class _WebViewScreenState extends State<WebViewScreen> {
//   final _webViewKey = GlobalKey<WebViewContainerState>();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Web View with Search'),
//       ),
//       body: WebViewContainer(
//         key: _webViewKey,
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           // Trigger the text search from the WebViewContainer
//           _webViewKey.currentState?.searchAndScrollToText('specific text');
//         },
//         child: Icon(Icons.search),
//       ),
//     );
//   }
// }
//
// class WebViewContainer extends StatefulWidget {
//   WebViewContainer({Key? key}) : super(key: key);
//
//   @override
//   WebViewContainerState createState() => WebViewContainerState();
// }
//
// class WebViewContainerState extends State<WebViewContainer> {
//   late WebViewController _webViewController;
//
//   @override
//   Widget build(BuildContext context) {
//     return WebViewWidget(
//       initialUrl: 'https://example.com', // Replace with your website URL
//       javascriptMode: JavascriptMode.unrestricted,
//       onWebViewCreated: (controller) {
//         _webViewController = controller;
//       }, controller: null,
//     );
//   }
//
//   Future<void> searchAndScrollToText(String searchText) async {
//     final String jsCode = """
//       var searchText = "$searchText";
//       var body = document.body;
//       var textNodes = [];
//
//       function searchAndHighlight(node) {
//         if (node.nodeType === Node.TEXT_NODE) {
//           while (true) {
//             var value = node.nodeValue;
//             var index = value.toLowerCase().indexOf(searchText.toLowerCase());
//             if (index === -1) break;
//
//             var span = document.createElement("span");
//             var text = value.substr(index, searchText.length);
//             var frag = node.splitText(index);
//             frag.nodeValue = frag.nodeValue.substr(searchText.length);
//             span.className = "highlight";
//             span.appendChild(document.createTextNode(text));
//             frag.parentNode.insertBefore(span, frag);
//             node = frag;
//             textNodes.push(span);
//           }
//         } else {
//           for (var i = 0; i < node.childNodes.length; i++) {
//             searchAndHighlight(node.childNodes[i]);
//           }
//         }
//       }
//
//       searchAndHighlight(body);
//       textNodes[0].scrollIntoView();
//     """;
//
//     await _webViewController.evaluateJavascript(jsCode);
//   }
// }
