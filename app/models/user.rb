class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  validates :nickname, presence: true
  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates :password, format: { with: VALID_PASSWORD_REGEX },presence: true
  validates :family_name, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/ },presence: true
  validates :first_name, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/ },presence: true
  validates :family_name_kana, presence: true,format: { with: /\A[\p{katakana}\p{blank}ー－]+\z/ }
  validates :first_name_kana, presence: true,format: { with: /\A[\p{katakana}\p{blank}ー－]+\z/ }
  validates :birthday, presence: true

  has_many :items
end
