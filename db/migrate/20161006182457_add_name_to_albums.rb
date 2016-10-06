class AddNameToAlbums < ActiveRecord::Migration[5.0]
  def change
    add_column :albums, :name, :string
    change_column_null :albums, :name, :false
  end
end
