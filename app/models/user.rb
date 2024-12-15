class User < ApplicationRecord
  has_secure_password
  has_many :sessions, dependent: :destroy

  normalizes :email_address, with: ->(e) { e.strip.downcase }
  # Validations
  validates :email_address, presence: true, uniqueness: true
  validates :password, presence: true, confirmation: true, length: { minimum: 6 }, on: :create
  validates :password_confirmation, presence: true, on: :create
  # validates :full_name, :phone, :designation, :department, :organization
end
