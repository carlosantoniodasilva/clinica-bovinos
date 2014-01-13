class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  rescue_from ActiveRecord::DeleteRestrictionError do |exception|
    association = exception.message.split.last
    redirect_to :back, alert: "Não é possível remover pois existem #{association} associados(as)."
  end
end
