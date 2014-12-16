part of signal_dart;

class InvokeResult {
	JsObject invokeResult;

	InvokeResult(this.invokeResult);

	void done(Function callback) {
		invokeResult.callMethod('done', [callback]);
	}
}
