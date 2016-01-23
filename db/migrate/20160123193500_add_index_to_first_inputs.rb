class AddIndexToFirstInputs < ActiveRecord::Migration
  def change
    add_index :first_inputs, :num_options
    add_index :first_inputs, :deal_type
    add_index :first_inputs, :biz_name
    add_index :first_inputs, :longer_descriptor
  end
end
