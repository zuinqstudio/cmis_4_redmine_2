class CmisProjectSetting < ActiveRecord::Base
  unloadable
  
  belongs_to :project
  
  def self.find_or_create(pj_id)
    setting = CmisProjectSetting.find(:first, :conditions => ['project_id = ?', pj_id])
        unless setting
          setting = CmisProjectSetting.new
          setting.project_id = pj_id
          setting.documents_base_path = Setting.plugin_redmine_cmis['documents_path_base']
          setting.save!      
        end
    return setting
  end
  
  def self.get_documents_base_path(project_id)
    return find_or_create(project_id).documents_base_path
  end
  
end
