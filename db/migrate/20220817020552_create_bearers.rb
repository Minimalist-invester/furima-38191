class CreateBearers < ActiveRecord::Migration[6.0]
  def change
    create_table :bearers do |t|

      t.timestamps
    end
  end
end
