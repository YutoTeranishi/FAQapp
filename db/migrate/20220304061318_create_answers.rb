class CreateAnswers < ActiveRecord::Migration[6.1]
  def change
    create_table :answers do |t|
      t.integer :question_id
      t.text :content
      t.integer :person_id
      t.timestamps
    end
  end
end
