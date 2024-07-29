class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :items
  has_many :order_histories

  validates :nickname, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :first_name_kana, presence: true
  validates :last_name_kana, presence: true
  validates :birthday, presence: true

  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i
  validates_format_of :password, with: PASSWORD_REGEX, message: 'is invalid. Include both letters and numbers'

  VALID_NAME_REGEX = /\A[ぁ-んァ-ヶ一-龥々ー]+\z/
  validates :first_name, presence: true,
                         format: { with: VALID_NAME_REGEX, message: 'is invalid. Input full-width characters' }
  validates :last_name, presence: true,
                        format: { with: VALID_NAME_REGEX, message: 'is invalid. Input full-width characters' }

  VALID_KANA_REGEX = /\A[ァ-ヶー－]+\z/
  validates :first_name_kana, presence: true,
                              format: { with: VALID_KANA_REGEX, message: 'is invalid. Input full-width katakana characters' }
  validates :last_name_kana, presence: true,
                             format: { with: VALID_KANA_REGEX, message: 'is invalid. Input full-width katakana characters' }
end
