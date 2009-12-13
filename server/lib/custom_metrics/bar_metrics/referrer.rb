class ReferrerMetricCalculator
  def initialize(date_range)
    @start_date = date_range.min
    @end_date = date_range.max
  end

  def compute
    date = @start_date
    while date <= @end_date
      puts "Date: #{date.strftime('%m/%d/%Y')}"
      data = _make_rows(RawDataPoint.find(:all, :conditions => "DATE(created_at) = DATE('#{date.strftime('%Y-%m-%d')}')"))
      data.each do |datum|
        row = PieData.find(:first, :conditions => {:data_type => 'referrer', :data_date => date, :category => datum[:category]})
        row = PieData.new(:data_type => 'referrer', :data_date => date, :category => datum[:category]) unless row
        row.data = datum[:data]
        row.save
      end
      puts "Processed: #{data.size} rows"
      date += 1.day
    end
  end

  private
  def _make_rows(raw_data_points)
    categories = {}
    raw_data_points.each do |datum|
      puts datum.data
      datum.data.split(/\n/).each do |var|
        if m = var.match(/page:(.+)/)
          category = m[1].strip
          puts category
          categories[category] = 0 unless categories[category]
          categories[category] += 1
        end
      end
    end
    categories.keys.collect{|cat| {:category => cat, :data => categories[cat].to_s } }
  end
end
