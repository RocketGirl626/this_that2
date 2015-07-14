class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.column :option1, :string
      t.column :option2, :string

      t.timestamps
    end
  end
end
