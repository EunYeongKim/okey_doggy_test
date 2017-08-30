class AddImageToPost < ActiveRecord::Migration
  def change
    add_column :posts, :image, :string
    add_column :users, :avatar, :string
  end
end
