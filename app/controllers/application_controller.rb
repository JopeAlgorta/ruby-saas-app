class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  set_current_tenant_through_filter
  before_action

  def set_current_account
    return unless current_user.present?
    current_account = current_user.account
    ActsAsTenant.current_tenant = current_account
  end
end
