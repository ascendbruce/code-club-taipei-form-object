class SignupsController < ApplicationController
  def new
    @company = Company.new
    @company.users.build
  end

  def create
    @company = Company.new(signup_params)
    if @company.save
      redirect_to company_path(@company)
    else
      render :new
    end
  end

  private

  def signup_params
    params.require(:company).permit(:name, :users_attributes => [:name, :email])
  end
end
