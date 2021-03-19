class Student < ApplicationRecord
  validates :name, :age, :house, presence: true
  has_many :student_courses
  has_many :courses, through: :student_courses

  def self.average_age
    average(:age).to_f
  end
end
