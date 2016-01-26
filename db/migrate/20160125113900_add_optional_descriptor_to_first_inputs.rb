class AddOptionalDescriptorToFirstInputs < ActiveRecord::Migration
  def change
    add_column :first_inputs, :option_descriptor, :string
  end
end
