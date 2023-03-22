class User < ApplicationRecord
  has_one :address
  has_one :user_hair
  has_one :user_bank
  has_one :user_company

  paginates_per 5
end
