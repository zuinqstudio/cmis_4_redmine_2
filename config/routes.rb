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

RedmineApp::Application.routes.draw do
  match 'sync_cmis_spaces', :controller => 'cmis', :via => [:get, :post]
  match 'projects/:project_id/cmis/:action', :controller => 'cmis', :via => [:get, :post]
  match 'projects/:project_id/:id/cmis/:action', :controller => 'cmis', :via => [:get, :post]
  match 'projects/:id/cmis_project_setting/:action', :controller => 'cmis_project_setting', :via => [:get, :post, :put, :patch]
end
