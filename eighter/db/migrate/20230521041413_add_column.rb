class AddColumn < ActiveRecord::Migration[6.0]
  def change
    add_column :posts, :additional_content, :text
  end
end
