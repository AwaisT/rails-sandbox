class CreateStudentModels < ActiveRecord::Migration[5.1]
  def change
    create_table :student_models do |t|

      t.timestamps
    end
  end
end
