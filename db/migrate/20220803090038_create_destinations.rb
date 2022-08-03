class CreateDestinations < ActiveRecord::Migration[6.0]
  def change
    create_table :destinations do |t|

      t.integer :user_id	           ,null: false,foreign_key: true
      t.string  :family_name	       ,null: false 
      t.string  :first_name	         ,null: false 
      t.string  :family_name_kana	   ,null: false
      t.string  :first_name_kane     ,null: false
      t.string  :post_code	         ,null: false
      t.string  :prefecture	         ,null: false
      t.string  :city	               ,null: false
      t.string  :address	           ,null: false
      t.string  :building_name	     
      t.string  :phone_number	     

      t.timestamps
    end
  end
end
