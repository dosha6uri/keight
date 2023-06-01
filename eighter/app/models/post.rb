class Post < ApplicationRecord
    belongs_to :user

    validates :body, presence: true
    validates :body, length: {maximum: 140}
    validates :addtional_content, absence: true, unless: :body?, length: {maximum: 1000}
    
end
