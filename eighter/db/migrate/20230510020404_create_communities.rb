class CreateCommunities < ActiveRecord::Migration[6.0]
  def change
    create_table :communities do |t|
      t.string :comm_name, uniq: true
      t.boolean :opened, null: false, default: true

      t.timestamps
    end
  end
end
