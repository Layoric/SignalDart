part of signal_dart;

class InvokeResult {
	JsObject invokeResult;

	InvokeResult(this.invokeResult);

	void done(Function callback) {
		invokeResult.callMethod('done', [callback]);
	}

	Future doneAsync() {
		var completer = new Completer();

    invokeResult.callMethod('done', [(_) => completer.complete(_)]);

    return completer.future;
	}
}
