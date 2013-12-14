class CreateInseminacoes < ActiveRecord::Migration
  def change
    create_table :inseminacoes do |t|
      t.references :bovino, index: true
      t.references :inseminador, index: true
      t.date :data

      t.timestamps
    end
  end
end
