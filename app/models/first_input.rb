class FirstInput < ActiveRecord::Base
	  validates :num_options, presence: true, length: { maximum: 255 }
	  validates :deal_type, presence: true, length: { maximum: 255 }
	  validates :biz_name, presence: true, length: { maximum: 255 }
	  validates :longer_descriptor, presence: true, length: { maximum: 255 }
end 

class Article < ActiveRecord::Base
	DEALTYPES = ['Product Deal', 'Gen Spend']
end

class Article < ActiveRecord::Base
	MULTSTRUCTURE = ['Multiplied', 'Optional', 'Complicated']
end

class Article < ActiveRecord::Base
	MULTIPLIERTYPE = ['Short Descriptor', 'People', 'Minute', 'Hour', 'Day', 'Week', 'Month', 'Year']
end

#array output functions use to convert integer inputs into string outputs
class Article < ActiveRecord::Base
	NUMERALS = ['Zero', 'One', 'Two', 'Three', 'Four', 'Five', 'Six', 
'Seven', 'Eight', 'Nine', 'Ten', 'Eleven', 'Twelve', 'Thirteen', 'Fourteen', 'Fifteen']
end


class FirstInput < ActiveRecord::Base
#determine the output functions called by dealprint in controller
  def self.show
  	if @first_input.num_options == 1 && @first_input.deal_type == "Gen Spend" && @first_input.multi_voucher == false
  		gensped_oneoption
		elsif @first_input.num_options >= 2 && @first_input.deal_type == "Gen Spend" && @first_input.multi_voucher == false
		  genspend_multoption
  	elsif @first_input.num_options == 1 && @first_input.deal_type == "Product Deal" && @first_input.multi_voucher == false
			proddeal_oneoption
  	elsif @first_input.num_options >= 2 && @first_input.deal_type == "Product Deal" && @first_input.multi_voucher == false	
  		proddeal_multoption
  	elsif @first_input.num_options == 1 && @first_input.deal_type == "Gen Spend" && @first_input.multi_voucher == true
  		gensped_oneoption
  	elsif @first_input.num_options >= 2 && @first_input.deal_type == "Gen Spend" && @first_input.multi_voucher == true
  		gensped_oneoption
  	elsif @first_input.num_options == 1 && @first_input.deal_type == "Product Deal" && @first_input.multi_voucher == true
  		gensped_oneoption
  	elsif @first_input.num_options >= 2 && @first_input.deal_type == "Product Deal" && @first_input.multi_voucher == true
  		gensped_oneoption
  	end
  end
end