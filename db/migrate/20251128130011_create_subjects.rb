class CreateSubjects < ActiveRecord::Migration[8.1]
  def change
    create_table :subjects do |t|
      t.string :subject_code
      t.string :subject_name
      t.integer :credit

      t.timestamps
    end
  end
end
