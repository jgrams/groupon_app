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

class Article < ActiveRecord::Base
	NUMERALS = ['Zero', 'One', 'Two', 'Three', 'Four', 'Five', 'Six', 
'Seven', 'Eight', 'Nine', 'Ten', 'Eleven', 'Twelve', 'Thirteen', 'Fourteen', 'Fifteen']
end


#Output functions called by show in controller
def gensped_oneoption
  	@gallery_title = "$pr for $va for " << @first_input.longer_descriptor
		@title = "$pr for $va Worth of " << @first_input.longer_descriptor << " from " << @first_input.biz_name
		@descriptor = @first_input.longer_descriptor
		@short_descriptor = @first_input.longer_descriptor
		@writeupheader = "####The Deal"
		@writeup = " * $pr for $val worth of " << @first_input.longer_descriptor.downcase
end

def genspend_multoption
  	@gallery_title = "Up to $max Off " << @first_input.longer_descriptor
		@title = "" << @first_input.longer_descriptor << " from " << @first_input.biz_name << " ($max Off). " << Article::NUMERALS[@first_input.num_options] << " Options Available."
		@descriptor = @first_input.longer_descriptor			
		@short_descriptor = @first_input.longer_descriptor
		@writeupheader = "####Choose Between " << Article::NUMERALS[@first_input.num_options] << " Options"
		@writeup = (" * $pr for " << @first_input.longer_descriptor.downcase << " (a $val value)")
end

def proddeal_oneoption
  		@gallery_title = "$pr for a " << @first_input.longer_descriptor
			@title = "$pr for a " << @first_input.longer_descriptor << " from " << @first_input.biz_name << " ($val Value)"
			@descriptor = @first_input.longer_descriptor
			@short_descriptor = @first_input.longer_descriptor
			@writeupheader = "####The Deal"
			@writeup = " * $pr for a " << @first_input.longer_descriptor.downcase << " (a $val value)"
end


#THIS FUNCTION NEEDS SOME TLC
def proddeal_multoption
	@gallery_title = "Up to $max Off " << @first_input.longer_descriptor
	@descriptor = @first_input.longer_descriptor
	@short_descriptor = @first_input.longer_descriptor
	@writeupheader = "####Choose Between " << Article::NUMERALS[@first_input.num_options] << " Options"
	@writeup = " * $pr for " << @first_input.longer_descriptor.downcase << " (a $val value)"
	if @first_input.multoption_types == "Multiplied" 
		
			if @first_input.optionals == "Short Descriptor"
				@title = "Up to $max Off " << @first_input.option_multiplier.split(' ').map(&:to_i).collect{|x| Article::NUMERALS[x]}.join(" or ") << " " << @first_input.longer_descriptor << " from " << @first_input.biz_name
			elsif @first_input.optionals == "People"
				@title = "Up to $max Off " << @first_input.longer_descriptor << " for " << @first_input.option_multiplier.split(' ').map(&:to_i).collect{|x| Article::NUMERALS[x]}.join(" or ") << " " << @first_input.optionals << " from " << @first_input.biz_name
#PARTICULARLY THIS			
			else
				@title = "Up to $max Off " << @first_input.option_multiplier.split(' ').map(&:to_i).join(" or ") << "  " << @first_input.optionals << " " << @first_input.longer_descriptor << " from " << @first_input.biz_name
			end
	elsif @first_input.multoption_types == "Optional"
		@title = "Up to $max Off " << @first_input.longer_descriptor << " With Optional " << @first_input.option_descriptor.split(", ")[0..-1].join(" or ").to_s << " from " << @first_input.biz_name
	elsif @first_input.multoption_types == "Complicated"
		@title = "Up to $max Off " << @first_input.longer_descriptor << " from " << @first_input.biz_name << ". " << Article::NUMERALS[@first_input.num_options] << " Options Available."
	end
end