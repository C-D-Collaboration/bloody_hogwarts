require 'rails_helper'

RSpec.describe Course, type: :model do

  describe 'validations' do
    it { should validate_presence_of(:name) }
  end

  describe 'relationships' do
    it {should have_many :student_courses}
    it {should have_many(:students).through(:student_courses)}
  end

  describe 'instance methods' do
    it "can sort courses by name" do
      course1 = Course.create(name: "Defense against the Dark Arts")
      course3 = Course.create(name: "Potions")
      course2 = Course.create(name: "Herbology")

      all_courses = Course.all
      sorted = Course.sorted_courses(all_courses)

      expect(sorted).to eq([course1, course2, course3])
    end
  end
end
