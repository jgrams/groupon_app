class FirstInput < ActiveRecord::Base
	  validates :num_options, presence: true, length: { maximum: 255 }
	  validates :deal_type, presence: true, length: { maximum: 255 }
	  validates :biz_name, presence: true, length: { maximum: 255 }
	  validates :longer_descriptor, presence: true, length: { maximum: 255 }
	  validates_presence_of :multoption_types, :if => :prod_andmult?
	
	def prod_andmult?
		:deal_type == "Product Deal" && :num_options >=2
	end
end 


class Article < ActiveRecord::Base
	DEALTYPES = ['Product Deal', 'Gen Spend']
end

class Article < ActiveRecord::Base
	MULTSTRUCTURE = ['Multiplied', 'Add-Ons', 'Complicated']
end

class Article < ActiveRecord::Base
	MULTIPLIERTYPE = ['Short Descriptor', 'People', 'Minute', 'Hour', 'Day', 'Week', 'Month', 'Year']
end

#array output functions use to convert integer inputs into string outputs
class Article < ActiveRecord::Base
	NUMERALS = ['Zero', 'One', 'Two', 'Three', 'Four', 'Five', 'Six', 
'Seven', 'Eight', 'Nine', 'Ten', 'Eleven', 'Twelve', 'Thirteen', 'Fourteen', 'Fifteen']
end
