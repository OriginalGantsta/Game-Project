class GuestUser < ApplicationRecord
    has_many :tokens
    has_many :games
end
