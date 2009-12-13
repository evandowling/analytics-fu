class RawDataController < ApplicationController
  def index
    @raw_data = RawDataPoint.connection.select_rows("SELECT UNIX_TIMESTAMP(DATE(created_at)) as d,COUNT(*) as c FROM raw_data_points GROUP BY DATE(created_at) ORDER BY d ASC")
  end

end
