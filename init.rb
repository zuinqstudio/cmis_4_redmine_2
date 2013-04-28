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

require 'redmine'
require 'active_cmis' 

#project setting tab
Rails.configuration.to_prepare do
  require_dependency 'projects_helper'
  unless ProjectsHelper.included_modules.include? CMISProjectsHelperPatch
    ProjectsHelper.send(:include, CMISProjectsHelperPatch)
  end
end

Redmine::Plugin.register :redmine_cmis do
	name 'Redmine 2.x Cmis Plugin'
	author 'Zuinq Studio'
	description 'Storage proyect files on your Cmis server'
	version '0.0.2'
	url 'http://www.zuinqstudio.com/en/funny-experiments-downloads'
	author_url 'http://www.zuinqstudio.com'

	menu :project_menu, :cmis, { :controller => 'cmis', :action => 'index' }, :caption => :cmis, :after => :documents, :param => :project_id

	settings :default => {
    'server_url' => 'http://localhost:8080/alfresco/service/cmis',
    'repository_id' => 'xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx',
		'server_login' => 'user',
		'server_password' => 'password',
		'documents_path_base' => 'REDMINE',
		'use_category' => true
	}, :partial => 'settings/cmis_settings'

	project_module :cmis do
		permission :view_cmis_documents, {:cmis => [:index, :show, :download]}, :public => true
		permission :manage_cmis_documents, :cmis => [:new, :edit, :destroy, :destroy_attachment, :synchronize, :synchronize_document, :import, :prepare_import, :add_attachment, :update_attachment]
	  permission :cmis_project_setting, {:cmis_project_setting => [:show, :update]}  
	end
	
  raise 'active_cmis library not installed' unless defined?(ActiveCMIS)

end
