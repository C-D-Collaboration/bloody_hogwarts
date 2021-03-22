require 'rails_helper'

RSpec.describe 'Courses', type: :feature do
  describe 'courses index' do
    before(:each) do
      @student1 = Student.create(name: "Harry", age: 12, house: "Griffindor")
      @student2 = Student.create(name: "Ron", age: 11, house: "Slytherin")
      @student3 = Student.create(name: "Jenny", age: 9, house: "Hufflepuff")
      @student4 = Student.create(name: "Beth", age: 13, house: "Ravenclaw")

      @course1 = Course.create(name: "Defense against the Dark Arts")
      # Ron, Jenny
      @course3 = Course.create(name: "Potions")
      # Harry, Ron, Beth
      @course2 = Course.create(name: "Herbology")
      # Harry, Jenny, Beth

      StudentCourse.create(student_id: @student1.id, course_id: @course2.id)
      StudentCourse.create(student_id: @student1.id, course_id: @course3.id)

      StudentCourse.create(student_id: @student2.id, course_id: @course3.id)
      StudentCourse.create(student_id: @student2.id, course_id: @course1.id)

      StudentCourse.create(student_id: @student3.id, course_id: @course1.id)
      StudentCourse.create(student_id: @student3.id, course_id: @course2.id)

      StudentCourse.create(student_id: @student4.id, course_id: @course3.id)
      StudentCourse.create(student_id: @student4.id, course_id: @course2.id)
    end

    it 'can see a list of courses and the number of students enrolled per course' do
      visit courses_path

      expect(page).to have_content("#{@course3.name}: #{@course3.students.count}")
      # expect(page).to_not have_content("#{@course3.name}: #{@course2.students.count}")
    end

    it "shows courses in alphabetical order" do
      visit courses_path

      expect(@course1.name).to appear_before(@course2.name)
      expect(@course2.name).to appear_before(@course3.name)

      expect(@course2.name).to_not appear_before(@course1.name)
    end

    it "show student per course in alphabetical order" do
      visit courses_path

      expect(@course1.students).to eq([@student3, @student2])
      expect(@course2.students).to eq([@student4, @student1, @student3])
      expect(@course3.students).to eq([@student4, @student1, @student2])
    end
  end
end
