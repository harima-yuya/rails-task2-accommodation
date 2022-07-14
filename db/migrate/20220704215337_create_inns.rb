class CreateInns < ActiveRecord::Migration[6.0]
  def change
    create_table :inns do |t|
      t.string :innName
      t.string :innArea
      t.integer :innPrice
      t.text :innMemo
      t.string :innImage
      t.integer :user_id

      t.timestamps
    end
  end
end
