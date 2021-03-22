class Course < ApplicationRecord
  validates :name, presence: true

  has_many :student_courses
  has_many :students, through: :student_courses

  def self.sorted_courses(all_courses)
    all_courses.sort_by do |course|
      course.name
    end
  end
end
