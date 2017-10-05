class Book < ApplicationRecord

validates :isbn, presence: true,length: { minimum: 5 }
validates :title, presence: true,length: { minimum: 5 }
validates :price, presence: true, numericality: true

end
