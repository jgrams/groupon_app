class CreateFirstInputs < ActiveRecord::Migration
  def change
    create_table :first_inputs do |t|
      t.integer :num_options
      t.string :deal_type
      t.string :biz_name
      t.string :longer_descriptor
      t.boolean :multi_voucher

      t.timestamps null: false
    end
  end
end
