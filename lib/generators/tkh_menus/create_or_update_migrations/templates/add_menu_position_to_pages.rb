class AddMenuPositionToPages < ActiveRecord::Migration
  def up
    add_column :pages, :menu_position, :integer, :default => 0
  end
  
  def down
    remove_column :pages, :menu_position
  end
end
