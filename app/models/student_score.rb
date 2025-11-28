class StudentScore < ApplicationRecord
  belongs_to :student
  belongs_to :subject

  # Validation cơ bản
  validates :subject_id, presence: true
  validates :subject_id,
            uniqueness: {
              scope: :student_id,
              message: "đã có điểm cho môn học này. Vui lòng chỉnh sửa điểm hiện tại."
            }
  validates :score1, presence: true,
            numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 10 }
  validates :score2, presence: true,
            numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 10 }

  # Custom validation để edit vẫn check trùng môn với record khác
  validate :subject_uniqueness_for_edit, on: :update

  def subject_uniqueness_for_edit
    if StudentScore.where(student_id: student_id, subject_id: subject_id)
                   .where.not(id: id).exists?
      errors.add(:subject_id, "đã có điểm cho môn học này. Vui lòng chỉnh sửa điểm hiện tại.")
    end
  end

  def grade
    # Dùng to_f để đảm bảo phép tính là float
    return nil if score1.nil? || score2.nil?

    # Đảm bảo tính toán trên float để tránh lỗi làm tròn
    total_score = (score1.to_f * 0.3 + score2.to_f * 0.7).round(2)


    case total_score
    when 8.0..10.0 then "A"
    when 6.5..7.99  then "B"
    when 5.0..6.49  then "C"
    else               "F"
    end
  end
end
