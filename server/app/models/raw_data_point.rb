class RawDataPoint < ActiveRecord::Base

  class << self
    def build_from_uri(path)
      data_point = RawDataPoint.new
      m = path.match(/handle_remote_event\/(.+)\?(.+)/)
      data_point.user_id = m[1]
      data_point.data = ''
      m[2].split(/&/).each do |named_argument|
        named_argument = named_argument.split(/=/)
        data_point.data += "#{CGI::unescape(named_argument.first)}: #{CGI::unescape(named_argument.last)}\n"
      end
      data_point.data.strip!
      data_point.save
      data_point
    end
  end
end
