class Pokemon < ApplicationRecord
    validates :name, presence: true
    validates :types, presence: true
    validates :capture_status, inclusion: { in: [true, false] }
    validates :image, format: { with: URI::regexp(%w[http https]), allow_blank: true }
  end
  
