SignalDart
==========

A package to help use SignalR JS client with Dart

###Example###
```
//Equivalent to var hc = $.hubConnection(url,options);
HubConnection hc = new HubConnection(url:'http://localhost:55780/signalr');
//Equivalent to $.connection.testHub on default local server
HubProxy proxy = hc.createHubProxy('testHub');
/*
 Equivalent to
 proxy.on('broadcastMessage', function (name, message) {
             //...
 });
 */
proxy.on('broadcastMessage', (String name,String message) {
    document.querySelector('#messageList').appendHtml('<li>' + name + ' - ' + message + '</li>');
  });
```
