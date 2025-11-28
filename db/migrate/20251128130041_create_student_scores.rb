class CreateStudentScores < ActiveRecord::Migration[8.1]
  def change
    create_table :student_scores do |t|
      t.references :student, null: false, foreign_key: true
      t.references :subject, null: false, foreign_key: true
      t.decimal :score1
      t.decimal :score2

      t.timestamps
    end
  end
end
