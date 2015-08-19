class CreateRates < ActiveRecord::Migration
  def change
    create_table :rates do |t|
      t.integer :body
      t.references :category, index: true

      t.timestamps
    end
  end
end
