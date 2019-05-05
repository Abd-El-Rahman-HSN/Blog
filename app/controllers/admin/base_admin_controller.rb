class Admin::BaseAdminController < ApplicationController
  layout 'dashboard'
  # before_action :authenticate_user!
  # before_action :check_user

  private

  def check_user
    redirect_to root_path unless current_user.admin? || current_user.supervisor?
  end
end
