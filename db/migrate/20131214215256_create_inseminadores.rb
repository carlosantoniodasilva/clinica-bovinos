class CreateInseminadores < ActiveRecord::Migration
  def change
    create_table :inseminadores do |t|
      t.string :nome

      t.timestamps
    end
  end
end
