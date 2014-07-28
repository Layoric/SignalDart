part of signal_dart;

class HubConnection {
  JsObject hubConnection;
  HubConnection({String url: null}) {
    hubConnection = context['\$'].callMethod('hubConnection');
    if(url != null) {
     hubConnection['url'] = url;
     hubConnection['useDefaultPath'] = false;
    }
  }

  createHubProxy(String hubName) {
    return new HubProxy(this,hubName);
  }

  start(Function callback) {
    JsObject startConnectionResult = hubConnection.callMethod('start',[{"jsonp",true}]);
    startConnectionResult.callMethod('done',[callback]);
  }
}
