class AddOptionMultiplierToFirstInputs < ActiveRecord::Migration
  def change
    add_column :first_inputs, :option_multiplier, :string
  end
end
