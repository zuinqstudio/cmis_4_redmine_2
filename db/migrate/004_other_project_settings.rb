class OtherProjectSettings  < ActiveRecord::Migration
  def self.up
    add_column :cmis_project_settings, :override_default, :boolean, :default => false
    add_column :cmis_project_settings, :use_category, :boolean, :default => true
  end
  
  def self.down
    remove_column :cmis_project_settings, :override_default
    remove_column :cmis_project_settings, :use_category
  end
  
end