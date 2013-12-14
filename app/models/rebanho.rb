class Rebanho < ActiveRecord::Base
  has_and_belongs_to_many :bovinos

  validates_presence_of :nome
end
