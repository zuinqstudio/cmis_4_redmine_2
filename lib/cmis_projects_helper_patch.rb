require_dependency 'projects_helper'

module CMISProjectsHelperPatch
  def self.included(base) # :nodoc:
    base.send(:include, ProjectsHelperMethodsCMIS)

    base.class_eval do
      unloadable # Send unloadable so it will not be unloaded in development

      alias_method_chain :project_settings_tabs, :cmis
    end

  end
end

module ProjectsHelperMethodsCMIS
  def project_settings_tabs_with_cmis
    tabs = project_settings_tabs_without_cmis
    action = {:name => 'cmis', 
      :controller => 'cmis_project_setting', 
      :action => :show, 
      :partial => 'cmis_project_setting/show', 
      :label => :cmis}

    tabs << action if User.current.allowed_to?(action, @project)

    tabs
  end
end