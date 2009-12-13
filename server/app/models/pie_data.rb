class PieData < ActiveRecord::Base

  class << self
    def find_by_type(type, date)
      date ||= Date.today
      PieData.find(:all, :conditions => "data_type = '#{type.escape_sql}' AND data_date = DATE('#{date.strftime('%Y-%m-%d')}')", :order => 'category asc') 
    end
  end
end
