# Allow the metal piece to run in isolation
require(File.dirname(__FILE__) + "/../../config/environment") unless defined?(Rails)

class HandleRemoteEvent
  def self.call(env)
    if env["PATH_INFO"] =~ /^\/handle_remote_event/
      [200, {"Content-Type" => "text/html"},[_send_callback(env['REQUEST_URI'].match(/^.+\/(handle_remote_event\/.+)/)[1])]]
    else
      [404, {"Content-Type" => "text/html"}, ["Not Found"]]
    end
  end

  private

  def self._send_callback(path)
    #parse out the params and shoot it over to the event machine server
    new_data = RawDataPoint.build_from_uri(path)
    "Appended Raw Data Point #{new_data.id}"
  end
end
