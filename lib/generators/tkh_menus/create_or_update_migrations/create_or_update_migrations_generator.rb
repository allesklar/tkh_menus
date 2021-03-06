require 'rails/generators/migration'
 
module TkhMenus
  module Generators
    class CreateOrUpdateMigrationsGenerator < ::Rails::Generators::Base
      include Rails::Generators::Migration
      source_root File.expand_path('../templates', __FILE__)
      desc "create or update page migrations"
      def self.next_migration_number(path)
        unless @prev_migration_nr
          @prev_migration_nr = Time.now.utc.strftime("%Y%m%d%H%M%S").to_i
        else
          @prev_migration_nr += 1
        end
        @prev_migration_nr.to_s
      end
 
      def copy_migrations
        migration_template "create_menus.rb", "db/migrate/create_menus.rb"
        migration_template "add_menu_position_to_pages.rb", "db/migrate/add_menu_position_to_pages.rb"
      end
 
    end
  end
end