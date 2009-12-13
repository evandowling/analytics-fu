class String
  def escape_sql
    self.gsub(/\\/,'\&\&').gsub(/'/,"''")
  end
end
