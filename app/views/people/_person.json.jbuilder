json.extract! person, :id, :name,:age, :address, :phoneN, :mail, :question_id, :answer_id, :created_at, :updated_at
json.url person_url(person, format: :json)
