class Client < ActiveRecord::Base
  has_many :reports, dependent: :destroy
  
  has_many :users, dependent: :destroy
  
  validates :name, presence: true,
                      length: { minimum: 3 }
end
