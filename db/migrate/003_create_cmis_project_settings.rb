class CreateCmisProjectSettings < ActiveRecord::Migration
  def change
    create_table :cmis_project_settings do |t|
      t.column :project_id, :integer
      t.column :documents_base_path, :string
    end
  end
end
