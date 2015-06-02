class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name, nil: false
      t.string :service_name, nil: true

      t.timestamps
    end
  end
end
