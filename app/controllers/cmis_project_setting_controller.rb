class CmisProjectSettingController < ApplicationController
  unloadable
  layout 'base'

  before_filter :find_project, :authorize, :find_user
  
  def update
    setting = CmisProjectSetting.find_or_create(@project.id)
    begin
       setting.transaction do
          setting.override_default = (params[:setting][:override_default].to_i == 1)
          setting.documents_base_path = params[:documents_base_path]
          setting.use_category = (params[:setting][:use_category].to_i == 1)
          setting.save!
       end
    flash[:notice] = l(:notice_successful_update)
    rescue
       flash[:error] = "Updating failed."
    end
         
    redirect_to :controller => 'projects', :action => "settings", :id => @project, :tab => 'cmis'
  end
  
  private
  def find_project
    # @project variable must be set before calling the authorize filter
    @project = Project.find(params[:id])
  end
  
  def find_user
    @user = User.current
  end
    
    
end
