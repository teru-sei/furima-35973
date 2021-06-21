class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname,           precence: true
  validates :email,              precence: true, unique: true
  validates :encrypted_password, precence: true
  validates :last_name,          precence: true
  validates :first_name,         precence: true
  validates :last_name_ka,       precence: true
  validates :first_name_ka,      precence: true
  validates :birthday,           precence: true
end
