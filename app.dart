import 'dart:math';
import 'dart:js';
import 'dart:html';
import 'dart:async';
import 'lib/signaldart.dart';

void main() {
  HubConnection hc = new HubConnection(url:'http://localhost:55780/signalr');
  HubProxy proxy = hc.createHubProxy('testHub');
  proxy.on('broadcastMessage', (String name,String message) {
    document.querySelector('#messageList').appendHtml('<li>' + name + ' - ' + message + '</li>');
  });
  hc.start((JsObject response) {
    document.querySelector('#sendMessage').onClick.listen((mouseEvent) {
      proxy.invoke('Send',[(document.querySelector('#chatName') as InputElement).value,(document.querySelector('#chatInput') as InputElement).value]);
    });
  });
}