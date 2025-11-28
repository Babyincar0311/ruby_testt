class Student < ApplicationRecord
  has_many :student_scores
  has_many :subject, through: :student_scores

  validates :student_code, presence: true
  validates :full_name, presence: true
  validates :address, presence: true
end
