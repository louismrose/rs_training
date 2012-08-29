# encoding: utf-8
require 'nokogiri'
require 'open-uri'
require_relative 'course.rb'

class ScrapesCourses
  
  def from(url)
    extract_course_elements(url)
    print_progress_bar
    scrape_each_course
    print_results
  end
  
private
  def extract_course_elements(url)
    @root = url[0,url.rindex('/')+1]
    index_page = Nokogiri::HTML(open(url))
    @course_els = index_page.css('li.course a')
  end
  
  def print_progress_bar
    puts "Scraping #{@course_els.size} courses"
    puts "." * @course_els.size
  end
  
  def scrape_each_course
    @course_els.each do |course_link|
      scrape_course(@root + course_link['href'])
      print '.'
    end
    
    puts ""
  end
  
  def scrape_course(url)
    course_page = Nokogiri::HTML(open(url)) 
    title_el = course_page.css('div#mdcolumn h1').first
    date_el = course_page.css('div#mdcolumn div#tabbed-content a').first

    if date_el
      title = title_el.content.strip
      date = date_el.content.strip
      
      courses << Course.new(title, date, url)
    end
  end
  
  def print_results
    puts "<ul>"
    courses.sort_by { |c| c.date }.each do |c|
      puts "  <li>#{c.to_html}</li>" 
    end
    puts "</ul>"
  end
  
  def courses
    @courses ||= []
  end
end