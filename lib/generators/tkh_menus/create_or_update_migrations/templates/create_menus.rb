class CreateMenus < ActiveRecord::Migration
  def up
    create_table :menus do |t|
      t.string :name
      t.string :path
      t.integer :parent_id
      t.integer :position
      t.timestamps
    end
    Menu.create_translation_table! :name => :string, :path => :string
  end
  
  def down
    drop_table :menus
    Menu.drop_translation_table!
  end
end
