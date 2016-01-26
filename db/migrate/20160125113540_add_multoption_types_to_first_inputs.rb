class AddMultoptionTypesToFirstInputs < ActiveRecord::Migration
  def change
    add_column :first_inputs, :multoption_types, :string
  end
end
