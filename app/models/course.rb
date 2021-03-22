class Course < ApplicationRecord
  validates :name, presence: true

  has_many :student_courses
  has_many :students, through: :student_courses

  def self.sorted_courses(all_courses)
    all_courses.sort_by do |course|
      course.name
    end
  end

  def self.sorted_students(all_courses)
    all_courses.each do |course|
      course.students.sort_by do |student|
        student.name
        # require "pry"; binding.pry
      end
    end
  end
end
