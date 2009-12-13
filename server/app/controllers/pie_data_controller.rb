class PieDataController < ApplicationController

  def index
    date = Date.parse('2009-12-13')
    @pie_data = PieData.find_by_type('referrer',date)
    @max = @pie_data.inject(0){|sum, d| sum += d.data.to_i}
  end

end
