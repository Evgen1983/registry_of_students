class CreateSubjects < ActiveRecord::Migration
  def change
    create_table :subjects do |t|
      t.belongs_to :student, index: true, foreign_key: true
      t.string :semestr
      t.string :name
      t.string :grade

      t.timestamps null: false
    end
  end
end
