class CreateFazendas < ActiveRecord::Migration
  def change
    create_table :fazendas do |t|
      t.string :nome

      t.timestamps
    end
  end
end
