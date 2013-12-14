class CreateBovinos < ActiveRecord::Migration
  def change
    create_table :bovinos do |t|
      t.references :fazenda
      t.integer :numero
      t.string :nome
      t.string :pai
      t.string :mae
      t.string :raca
      t.string :pelagem
      t.string :sexo
      t.date :data_nascimento

      t.timestamps
    end
  end
end
