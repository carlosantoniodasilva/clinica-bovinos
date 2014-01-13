class Fazenda < ActiveRecord::Base
  has_many :bovinos, dependent: :restrict_with_exception

  validates_presence_of :nome
end
