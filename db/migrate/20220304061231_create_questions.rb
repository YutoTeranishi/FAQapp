class CreateQuestions < ActiveRecord::Migration[6.1]
  def change
    create_table :questions do |t|
      t.text :title
      t.text :content
      t.boolean :finished
      t.integer :person_id
      t.timestamps
    end
  end
end
