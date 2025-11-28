class CreateStudents < ActiveRecord::Migration[8.1]
  def change
    create_table :students do |t|
      t.string :student_code
      t.string :full_name
      t.string :address

      t.timestamps
    end
  end
end
