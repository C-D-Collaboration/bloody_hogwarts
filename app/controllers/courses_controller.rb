class CoursesController < ApplicationController
  def index
    all_courses = Course.all
    @courses = Course.sorted_courses(all_courses)
  end
end
