class Cats < ActiveRecord::Base
	has_many :rates, dependent: :destroy
	validates :category, presence: true,
                    length: { minimum: 3 }

end
