# Encoding: UTF-8
# Written by: Zuinq Studio
# Email: info@zuinqstudio.com 
# Web: http://www.zuinqstudio.com 

# This work is licensed under a Creative Commons Attribution 3.0 License.
# [ http://creativecommons.org/licenses/by/3.0/ ]

# This means you may use it for any purpose, and make any changes you like.
# All we ask is that you include a link back to our page in your credits.

# Last but not least, this project was supported by Bonsai Meme - http://www.bmeme.com

# Looking forward your comments and suggestions! info@zuinqstudio.com

class CreateCmisDocuments < ActiveRecord::Migration
  def self.up
    create_table :cmis_documents do |t|
      t.column :project_id, :integer
      t.column :category_id, :integer
      t.column :author_id, :integer
      t.column :title, :string
      t.column :description, :text
      t.column :path, :text
      t.column :created_on, :datetime
      t.column :updated_on, :datetime
    end

    create_table :cmis_attachments do |t|
      t.column :cmis_document_id, :integer, :null => false
      t.column :author_id, :integer
      t.column :filesize, :integer
      t.column :content_type, :string
      t.column :description, :text
      t.column :path, :text
      t.column :created_on, :datetime
      t.column :updated_on, :datetime
    end

    add_index "cmis_documents", ["project_id"], :name => "cmis_documents_project_id"
  end

  def self.down
    drop_table :cmis_documents
    drop_table :cmis_attachments
  end
end
