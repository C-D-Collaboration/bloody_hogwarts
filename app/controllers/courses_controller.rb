class CoursesController < ApplicationController
  def index
    all_students = Student.all
    all_courses = Course.all
    @courses = Course.sorted_courses(all_courses)
    @courses_students = Course.sorted_students(all_students)
    require "pry"; binding.pry
  end
end
