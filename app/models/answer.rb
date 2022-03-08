class Answer < ApplicationRecord
  belongs_to :question
  belongs_to:person
  validates :content,presence:{message:'は必須項目です。'}
end
