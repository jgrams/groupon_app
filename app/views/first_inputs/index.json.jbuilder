json.array!(@first_inputs) do |first_input|
  json.extract! first_input, :id, :num_options, :deal_type, :biz_name, :longer_descriptor, :multi_voucher
  json.url first_input_url(first_input, format: :json)
end
