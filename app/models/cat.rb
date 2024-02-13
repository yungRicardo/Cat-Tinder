class Cat < ApplicationRecord
   validates :name, presence: true
   validates :age, presence: true, numericality: { only_integer: true, greater_than: 0 }
   validates :enjoys, length: { minimum: 10 }, presence: true
   validates :image, presence: true
 end
 