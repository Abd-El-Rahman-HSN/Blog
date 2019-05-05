class Admin::AdminsController < Admin::BaseAdminController
  def dashboard
    render 'admin/admins/dashboard'
  end
end
