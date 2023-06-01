class Joining < ApplicationRecord
    belongs_to :user, optional: true
    belongs_to :communities, optional: true
    validates :user_id, presence: true
    validates :comm_id, presence:true
end
