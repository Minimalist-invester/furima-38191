class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string  :product
      t.text    :product_description
      t.integer :price
      t.integer :category_id
      t.integer :condition_id
      t.integer :bearer_id
      t.integer :prefecure_id
      t.integer :ship_date_id
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end