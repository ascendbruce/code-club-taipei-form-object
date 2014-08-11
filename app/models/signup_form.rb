class SignupForm
  include ActiveModel::Model

  attr_reader :company
  attr_reader :user

  attr_accessor :company_name
  attr_accessor :name
  attr_accessor :email

  validates :company_name, presence: true
  validates :name,         presence: true
  validates :email,        presence: true
  validate :email_uniqueness

  # Forms are never themselves persisted
  def persisted?
    false
  end

  def save
    if valid?
      @company = Company.create!(name: company_name)
      @user    = @company.users.create!(name: name, email: email)
      true
    else
      false
    end
  end

  private

  def email_uniqueness
    if User.where(email: email).exists?
      errors.add :email, "has already been taken"
    end
  end
end
