class StudentsController < ApplicationController
  def index
    all_students = Student.all
    @students = Student.sorted_students(all_students)
    @average_age = Student.average_age
  end

  def show
    @student = Student.find(params[:id])
    @courses = @student.courses
  end
end
