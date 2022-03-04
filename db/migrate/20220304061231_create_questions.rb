class CreateQuestions < ActiveRecord::Migration[6.1]
  def change
    create_table :questions do |t|
      t.text :title
      t.text :content
      t.text :name
      t.booleam :finished

      t.timestamps
    end
  end
end
