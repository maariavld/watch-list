class AddListPicUrl < ActiveRecord::Migration[6.0]
  def change
    add_column :lists, :image_url, :text
  end
end
