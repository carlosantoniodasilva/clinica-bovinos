class Fazenda < ActiveRecord::Base
  has_many :bovinos

  validates_presence_of :nome
end
