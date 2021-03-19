require 'rails_helper'

RSpec.describe Student, type: :model do

  describe 'validations' do
    it {should validate_presence_of :name}
    it {should validate_presence_of :age}
    it {should validate_presence_of :house}
  end

  describe 'relationships' do
    it {should have_many :student_courses}
    it {should have_many(:courses).through(:student_courses)}
  end

  describe 'instance methods' do
    it "can find the average age of all students" do
      student1 = Student.create(name: "Harry", age: 12, house: "Griffindor")
      student2 = Student.create(name: "Ron", age: 11, house: "Slytherin")
      student3 = Student.create(name: "Jenny", age: 9, house: "Hufflepuff")
      student4 = Student.create(name: "Beth", age: 13, house: "Ravenclaw")

      average_age = Student.average_age

      expect(average_age).to eq(11.25)
    end
  end
end
