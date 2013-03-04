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

class AttachmentDirtyColumn < ActiveRecord::Migration
  def self.up
    add_column :cmis_attachments, :dirty, :boolean, :default => false
    add_column :cmis_attachments, :deleted, :boolean, :default => false
  end

  def self.down
    remove_column :cmis_attachments, :dirty
    remove_column :cmis_attachments, :deleted
  end
end
