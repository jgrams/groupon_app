class FirstInput < ActiveRecord::Base
	  validates :num_options, presence: true, length: { maximum: 255 }
	  validates :deal_type, presence: true, length: { maximum: 255 }
	  validates :biz_name, presence: true, length: { maximum: 255 }
	  validates :longer_descriptor, presence: true, length: { maximum: 255 }
end

class Article < ActiveRecord::Base
	DEALTYPES = ['Product Deal', 'Gen Spend']
end

