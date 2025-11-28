class Subject < ApplicationRecord
  has_many :student_scores
  has_many :students, through: :student_scores
  validates :subject_code, presence: true
  validates :subject_name, presence: true
  validates :credit, presence: true
end
