class SignupsController < ApplicationController
  def new
    @signup_form = SignupForm.new
  end

  def create
    @signup_form = SignupForm.new(params[:signup_form])
    if @signup_form.save
      redirect_to company_path(@signup_form.company)
    else
      render :new
    end
  end
end
