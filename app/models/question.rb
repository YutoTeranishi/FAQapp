class Question < ApplicationRecord
  has_many :answer
  belongs_to:person
  validates :content, presence:{message:'は必須項目です。'}
end
