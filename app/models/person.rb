class Person < ApplicationRecord
  belongs_to:account
  has_many:question
  has_many:answer

  validates :account_id,:name,:age,:address,:mail, presence:{message:'は必須項目です。'}
end
