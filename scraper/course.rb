require 'date'

class Course
  attr_reader :title, :date, :url
  
  def initialize(title, date, url)
    @title = title
    @date = Date.parse(date)
    @url = url
  end
  
  def to_html
    "#{@date.strftime('%d %b')} - <a href=\"#{@url}\">#{@title}</a>"
  end
end