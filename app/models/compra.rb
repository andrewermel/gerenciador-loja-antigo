class Compra < ApplicationRecord
    validates :item, :presence => true
end
