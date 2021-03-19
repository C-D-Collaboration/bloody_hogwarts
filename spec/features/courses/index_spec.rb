require 'rails_helper'

RSpec.describe 'Courses', type: :feature do
  describe 'courses index' do
    before(:each) do
      @student1 = Student.create(name: "Harry", age: 12, house: "Griffindor")
      @student2 = Student.create(name: "Ron", age: 11, house: "Slytherin")
      @student3 = Student.create(name: "Jenny", age: 9, house: "Hufflepuff")
      @student4 = Student.create(name: "Beth", age: 13, house: "Ravenclaw")

      @course1 = Course.create(name: "Defense against the Dark Arts")
      @course2 = Course.create(name: "Herbology")
      @course3 = Course.create(name: "Potions")

      StudentCourse.create(student_id: @student1.id, course_id: @course2.id)
      StudentCourse.create(student_id: @student1.id, course_id: @course3.id)
      StudentCourse.create(student_id: @student2.id, course_id: @course3.id)
    end

    it 'can see a list of courses and the number of students enrolled per course' do
      visit "/courses"

      expect(page).to have_content("#{@course3.name}: #{@course3.students.count}")
      expect(page).to_not have_content("#{@course3.name}: #{@course2.students.count}")
    end
  end
end