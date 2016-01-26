class AddOptionalsToFirstInputs < ActiveRecord::Migration
  def change
    add_column :first_inputs, :optionals, :string
  end
end
