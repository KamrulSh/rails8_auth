class RegistrationsController < ApplicationController
  allow_unauthenticated_access only: %i[new create]
  before_action :redirect_if_authenticated, only: %i[new create]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to root_path, notice: "Registration successful! Please log in."
    else
      Rails.logger.info(@user.errors.full_messages) # Logs errors to the console
      flash.now[:alert] = "Registration failed. Please check the form."
      render :new, status: :unprocessable_entity
    end
  end

  private

  def redirect_if_authenticated
    if authenticated?
      redirect_to root_path, alert: "You are already logged in."
    end
  end

  # Permit only the required parameters
  def user_params
    params.require(:user).permit(
      :full_name, :email_address, :password, :password_confirmation,
      :phone, :designation, :department, :organization, :scholar_idx, :orchid_idx
    )
  end
end
