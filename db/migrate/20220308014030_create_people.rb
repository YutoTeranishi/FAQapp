class CreatePeople < ActiveRecord::Migration[6.1]
  def change
    create_table :people do |t|
      t.integer :account_id
      t.text :name
      t.integer :age
      t.text :address
      t.bigint :phoneN
      t.text :mail

      t.timestamps
    end
  end
end
