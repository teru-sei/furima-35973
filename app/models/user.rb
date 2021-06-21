class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname,           presence: true
  validates :email,              presence: true
  validates :password,           presence: true, format:{with: /(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]{7,}/, message: "is invalid. Include both letters and numbers"}
  validates :last_name,          presence: true, format:{with: /\A[ぁ-んァ-ン一-龥]/, message: "is invalid. Input full-width characters"}
  validates :first_name,         presence: true, format:{with: /\A[ぁ-んァ-ン一-龥]/, message: "is invalid. Input full-width characters"}
  validates :last_name_ka,       presence: true, format:{with: /\A[ァ-ヶー－]+\z/, message: "is invalid. Input full-width katakana characters"}
  validates :first_name_ka,      presence: true, format:{with: /\A[ァ-ヶー－]+\z/, message: "is invalid. Input full-width katakana characters"}
  validates :birthday,           presence: true

  has_many :items
  has_many :purchases
end
