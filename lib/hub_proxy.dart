part of signal_dart;

class HubProxy {
  invoke(String methodName, List<Object> parameters) {
    List<Object> args = new List<Object>();
    args.add(methodName);
    args.addAll(parameters);
    hubProxy.callMethod('invoke',args);
  }

  HubConnection hubConnection;
  JsObject hubProxy;
  HubProxy(this.hubConnection,String hubName) {
    hubProxy = hubConnection.hubConnection.callMethod('createHubProxy',[hubName]);
  }

  on(String methodName,Function callback) {
    hubProxy.callMethod('on',[methodName,callback]);
  }
}