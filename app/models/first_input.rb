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
	MULTSTRUCTURE = ['With Optional:', 'Multiplied', 'Deal is Complicated']
end

class Article < ActiveRecord::Base
	MULTIPLIERTYPE = ['Short Descriptor', 'People', 'Minute', 'Hour', 'Day', 'Week', 'Month', 'Year']
end

#array output functions use to convert integer inputs into string outputs
class Article < ActiveRecord::Base
	NUMERALS = ['Zero', 'One', 'Two', 'Three', 'Four', 'Five', 'Six', 
'Seven', 'Eight', 'Nine', 'Ten', 'Eleven', 'Twelve', 'Thirteen', 'Fourteen', 'Fifteen']
end


def gensped_oneoption
  	@gallery_title = "$pr for $va for " << @first_input.longer_descriptor
		@title = "$pr for $va Worth of " << @first_input.longer_descriptor << " from " << @first_input.biz_name
		@descriptor = @first_input.longer_descriptor
		@short_descriptor = @first_input.longer_descriptor
		@writeup = "####The Deal * $pr for a " << @first_input.longer_descriptor << " (a $val value)".downcase
end