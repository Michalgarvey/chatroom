class AddPropertiesToRooms < ActiveRecord::Migration[5.1]
  def change
    add_column :rooms, :image_url, :string
    add_column :rooms, :description, :text
  end
end
