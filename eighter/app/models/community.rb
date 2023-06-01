class Community < ApplicationRecord
    has_many :joinings
    has_many :users, through: :joinings

    validates :comm_name, presence: true
    validates :comm_name, length: {maximum: 16}
    validates :intro, absence: true, unless: :comm_name?, length: {maximum: 200}
end
