class AddCreateUserIdToCommunities < ActiveRecord::Migration[6.0]
  def change
    add_column :communities, :create_user_id, :integer, null: false
  end
end
