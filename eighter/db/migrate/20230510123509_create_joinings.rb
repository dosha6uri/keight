class CreateJoinings < ActiveRecord::Migration[6.0]
  def change
    create_table :joinings do |t|
      t.integer :user_id
      t.integer :comm_id

      t.timestamps
    end
  end
end
