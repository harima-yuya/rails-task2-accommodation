class CreateReserves < ActiveRecord::Migration[6.0]
  def change
    create_table :reserves do |t|
      t.integer :inn_id
      t.datetime :start_date
      t.datetime :end_date
      t.integer :guest_num
    

      t.timestamps
    end
  end
end
