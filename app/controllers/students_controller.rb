class StudentsController < ApplicationController
  def index
    @students = Student.all
    @average_age = Student.average_age
  end

  def show
    @student = Student.find(params[:id])
    @courses = @student.courses
  end
end
