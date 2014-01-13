class Bovino < ActiveRecord::Base
  PELAGENS = [
    'Nelore'
  ]

  RACAS = [
    'Aberdeen Angus',
    'Blanc-Blue-Belge',
    'Blonded`Aquitaine',
    'Belgian Blue',
    'Bradford',
    'Brahman',
    'Brangus',
    'Bravon',
    'Charolesa',
    'Canchim',
    'Charolês',
    'Chianina',
    'Caracu',
    'Carabao ou Rosilho',
    'Devon',
    'Gir',
    'Guzerá',
    'Hereford',
    'InduBrasil',
    'Limousin',
    'Marchigiana',
    'Nelore',
    'Piomontesa',
    'Red Angus',
    'Romagnolo',
    'Santa Gertrudis',
    'Simental',
    'Shorthorn',
    'Tabapuã'
  ]

  SEXOS = %w(Macho Fêmea).each do |sexo|
    scope sexo.parameterize, -> { where sexo: sexo }
  end

  belongs_to :fazenda
  has_many :inseminacoes, dependent: :restrict_with_exception

  validates_presence_of :fazenda_id, :numero, :nome, :pelagem, :raca, :sexo, :data_nascimento
  validates_inclusion_of :pelagem, in: PELAGENS, allow_blank: true
  validates_inclusion_of :raca, in: RACAS, allow_blank: true
  validates_inclusion_of :sexo, in: SEXOS, allow_blank: true
end
