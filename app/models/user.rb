class User < ApplicationRecord

  has_many :products dependent: :destroy
  belongs_to :destination dependent: :destroy
  belongs_to :card dependent: :destroy

end
