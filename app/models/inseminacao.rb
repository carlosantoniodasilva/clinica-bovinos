class Inseminacao < ActiveRecord::Base
  belongs_to :inseminador
  belongs_to :bovino

  validates_presence_of :data, :inseminador_id, :bovino_id
end
