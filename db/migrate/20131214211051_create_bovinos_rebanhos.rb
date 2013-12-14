class CreateBovinosRebanhos < ActiveRecord::Migration
  def change
    create_join_table :bovinos, :rebanhos
  end
end
