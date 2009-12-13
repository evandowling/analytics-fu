// complicated code that jumps around is best wrapped in objects --
// this function is an object creator, we can now call 'new Tracker()' 

function EventTracking(host,id) {
	function _trackEvent(dimensionalData) {
    var params = []
		for (dimension in dimensionalData) {
      params.push(dimension + '=' + escape(dimensionalData[dimension]));
		}
	  var pixel = new Image();
		pixel.src = this.src + params.join('&');
	}
  this.trackEvent = _trackEvent;
	this.src = 'http://' + host + '/handle_remote_event/' + id + '?';
}

var _tracker = null

function intializeEventTracking(host,id) {
  _tracker = new EventTracking(host,id);
}


