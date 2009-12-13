// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults
	function formatDate(d, fmt, monthNames) {
				var leftPad = function(n) {
					n = "" + n;
					return n.length == 1 ? "0" + n : n;
				};
				
				var r = [];
				var escape = false;
				if (monthNames == null)
					monthNames = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"];
				for (var i = 0; i < fmt.length; ++i) {
					var c = fmt.charAt(i);
					
					if (escape) {
						switch (c) {
						case 'h': c = "" + d.getHours(); break;
						case 'H': c = leftPad(d.getHours()); break;
						case 'M': c = leftPad(d.getMinutes()); break;
						case 'S': c = leftPad(d.getSeconds()); break;
						case 'd': c = "" + d.getDate(); break;
						case 'm': c = "" + (d.getMonth() + 1); break;
						case 'y': c = "" + d.getFullYear(); break;
						case 'b': c = "" + monthNames[d.getMonth()]; break;
						}
						r.push(c);
						escape = false;
					}
					else {
						if (c == "%")
							escape = true;
						else
							r.push(c);
					}
				}
				return r.join("");
			}

