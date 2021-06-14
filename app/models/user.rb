class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :lists
  validates :first_name, :last_name, :username, :email, :encrypted_password, presence: true
  validates :username, length: { minimum: 4 }, uniqueness: true
  validates :encrypted_password, length: { minimum: 6}
  validate :password_requirements_are_met
  validates :email, uniqueness: true
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, message: "valid email please"
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def password_requirements_are_met
  rules = {
    " must contain at least one lowercase letter"  => /[a-z]+/,
    " must contain at least one uppercase letter"  => /[A-Z]+/,
    " must contain at least one digit"             => /\d+/,
    " must contain at least one special character" => /[^A-Za-z0-9]+/
  }

  rules.each do |message, regex|
    errors.add( :encrypted_password, message ) unless encrypted_password.match( regex )
  end
end
end
