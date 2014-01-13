class Inseminador < ActiveRecord::Base
  has_many :inseminacoes, dependent: :restrict_with_exception

  validates_presence_of :nome
end
