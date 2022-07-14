class AddPriceSumToReserve < ActiveRecord::Migration[6.0]
  def change
    add_column :reserves, :price_sum, :integer
  end
end
