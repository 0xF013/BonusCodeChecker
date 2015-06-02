class CreateCodes < ActiveRecord::Migration
  def change
    create_table :codes do |t|
      t.string :value, nil: false
      t.boolean :sold, default: false
      t.belongs_to :product

      t.timestamps
    end
    add_index :codes, :product_id
  end
end
