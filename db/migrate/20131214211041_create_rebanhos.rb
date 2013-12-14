class CreateRebanhos < ActiveRecord::Migration
  def change
    create_table :rebanhos do |t|
      t.string :nome

      t.timestamps
    end
  end
end
