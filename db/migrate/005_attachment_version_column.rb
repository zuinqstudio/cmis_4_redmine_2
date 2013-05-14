class AttachmentVersionColumn < ActiveRecord::Migration
  def self.up
    add_column :cmis_attachments, :version, :string
  end

  def self.down
    remove_column :cmis_attachments, :version
  end
end