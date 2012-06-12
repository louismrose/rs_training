require 'date'

class Course
  attr_reader :title, :date, :category, :url
  
  def initialize(title, date, category, url)
    @title = title
    @date = Date.parse(date)
    @category = category
    @url = url
  end
  
  def to_html
    "#{@date.strftime('%d %b')} - <a href=\"#{@url}\">#{@title}</a>"
  end
end