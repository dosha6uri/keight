class AddCommIdToPosts < ActiveRecord::Migration[6.0]
  def change
    add_column :posts, :comm_id, :integer
  end
end
