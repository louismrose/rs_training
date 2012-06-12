require_relative 'scrapes_courses.rb'

url = 'https://www.york.ac.uk/admin/hr/researcher-development/programme/?t=RESSTUDS'

ScrapesCourses.new.from(url)