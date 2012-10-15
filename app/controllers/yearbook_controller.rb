require 'open-uri'


class YearbookController < ApplicationController


  def amstudents
    json_response = open("http://codemountain.com/api/students/am.json").read 
    @students = JSON.parse(json_response)
    @type = 'AM Students'
  end

  def pmstudents
    json_response = open("http://codemountain.com/api/students/pm.json").read 
    @students = JSON.parse(json_response)   
    @type = 'PM Students' 
    render "amstudents"
  end

  def staff
    json_response = open("http://codemountain.com/api/students/rfd.json").read 
    @students = JSON.parse(json_response)
    @type = 'Staff'
    render "amstudents"
  end
  
  def all
    json_response = open("http://codemountain.com/api/students/am.json").read 
    @students = JSON.parse(json_response)
    json_response = open("http://codemountain.com/api/students/pm.json").read 
    students1 = JSON.parse(json_response)
    json_response = open("http://codemountain.com/api/students/rfd.json").read 
    students2 = JSON.parse(json_response)
    @students.concat(students1.concat(students2))
    @type = 'All members'
    render "amstudents"  
  end

end
