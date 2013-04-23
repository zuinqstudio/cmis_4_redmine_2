class CmisProjectSetting < ActiveRecord::Base
  unloadable
  
  belongs_to :project
  
  def self.find_or_create(pj_id)
    setting = CmisProjectSetting.find(:first, :conditions => ['project_id = ?', pj_id])
        unless setting
          setting = CmisProjectSetting.new
          setting.project_id = pj_id
          setting.documents_base_path = Setting.plugin_redmine_cmis['documents_path_base']
          setting.use_category = !!Setting.plugin_redmine_cmis['use_category']
          setting.save!      
        end
    return setting
  end
  
  def self.get_documents_base_path(project_id)
    project_setting = find_or_create(project_id)
    if(project_setting.override_default)
      return project_setting.documents_base_path
    else
      return Setting.plugin_redmine_cmis['documents_path_base'] 
    end
  end
  
  def self.use_category(project_id)
    project_setting = find_or_create(project_id)
    if(project_setting.override_default)
      return project_setting.use_category
    else
      return Setting.plugin_redmine_cmis['use_category'] 
    end
  end
  
end
