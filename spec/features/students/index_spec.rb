# User Story 1 of 4

# As a visitor,
# When I visit '/students',
# I see a list of students with the following information:
# -Name
# -Age
# -House
# (e.g. "Name: Casseopia Black, Age: 14, House: Slytherin")
require 'rails_helper'

RSpec.describe 'student index' do
  before :each do
    @student1 = Student.create(name: "Harry", age: 12, house: "Griffindor")
    @student2 = Student.create(name: "Ron", age: 11, house: "Slytherin")
    @student3 = Student.create(name: "Jenny", age: 9, house: "Hufflepuff")
    @student4 = Student.create(name: "Beth", age: 13, house: "Ravenclaw")
  end

  it 'can see a list of students with name, age, and house' do
    visit students_path

    expect(page).to have_content('All Students')
    within(first('.student')) do
      expect(page).to have_css('.name')
      expect(page).to have_css('.age')
      expect(page).to have_css('.house')
    end
    # expect(page).to have_content(@student1.name)
    # expect(page).to have_content(@student2.name)
    # expect(page).to have_content(@student3.name)
    # expect(page).to have_content(@student4.name)
    #
    # expect(page).to have_content(@student1.age)
    # expect(page).to have_content(@student2.age)
    # expect(page).to have_content(@student3.age)
    # expect(page).to have_content(@student4.age)
    #
    # expect(page).to have_content(@student1.house)
    # expect(page).to have_content(@student2.house)
    # expect(page).to have_content(@student3.house)
    # expect(page).to have_content(@student4.house)
  end

  it "can see the average age of all students" do
    visit students_path

    expect(page).to have_content("Average Age: 11.25")
  end

  it 'shows students in alphabetical order' do
    visit students_path

    expect(@student4.name).to appear_before(@student1.name)
    expect(@student1.name).to appear_before(@student3.name)
    expect(@student3.name).to appear_before(@student2.name)

    expect(@student1.name).to_not appear_before(@student4.name)
  end
end
