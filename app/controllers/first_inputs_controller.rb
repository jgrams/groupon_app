class FirstInputsController < ApplicationController
  before_action :set_first_input, only: [:index, :edit, :update, :destroy, :dealprint, :show]

#add a contact page
	def contact
  end

#add a about page
	def about
  end
  
  def show
  #REMOVE FIRST LINE WHEN MULTI VOUCHERS IS ADDED
  @first_input.multi_voucher = false
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

  # GET /first_inputs
  # GET /first_inputs.json
  def index
    @first_inputs = FirstInput.all
  end
  
  #HELPER FUNCTIONS TO CALL THE APPROPRIATE WRITEUP OUTPUT 
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
		@temp_writeup = " * $pr for $val worth of " << @first_input.longer_descriptor.downcase
		@writeup = "#{@temp_writeup}\n" * @first_input.num_options
	end

	def proddeal_oneoption
		@gallery_title = "$pr for a " << @first_input.longer_descriptor
		@title = "$pr for a " << @first_input.longer_descriptor << " from " << @first_input.biz_name << " ($val Value)"
		@descriptor = @first_input.longer_descriptor
		@short_descriptor = @first_input.longer_descriptor
		@writeupheader = "####The Deal"
		@writeup = " * $pr for a " << @first_input.longer_descriptor.downcase << " ($val value)"
	end


#THIS FUNCTION NEEDS SOME TLC
	def proddeal_multoption
		@gallery_title = "Up to $max Off " << @first_input.longer_descriptor
		@descriptor = "" << @first_input.longer_descriptor	
		@short_descriptor = "" << @first_input.longer_descriptor
		@writeupheader = "####Choose Between " << Article::NUMERALS[@first_input.num_options] << " Options"
		@temp_writeup = " * $pr for " << @first_input.longer_descriptor.downcase << " ($val value)"
		@writeup = "#{@temp_writeup}\n" * @first_input.num_options
			if @first_input.multoption_types == "Multiplied" 
			
				if @first_input.optionals == "Deal Times Two"
					@title = "" @first_input.option_multiplier.split(' ').map(&:to_i).collect{|x| Article::NUMERALS[x]}.join(" or ") << " " << @first_input.longer_descriptor << " from " << @first_input.biz_name << " Up to $max Off"
				elsif @first_input.optionals == "People"
					@title = "" << @first_input.longer_descriptor << " for " << @first_input.option_multiplier.split(' ').map(&:to_i).collect{|x| Article::NUMERALS[x]}.join(" or ") << " " << @first_input.optionals << " from " << @first_input.biz_name << " Up to $max Off"
#PARTICULARLY THIS Which is the Time based one	
				else
					@title = ""  << @first_input.option_multiplier.split(' ').map(&:to_i).join(" or ") << "  " << @first_input.optionals << " " << @first_input.longer_descriptor << " from " << @first_input.biz_name << " Up to $max Off"
				end
			
			elsif @first_input.multoption_types == "Add-Ons"
				@title = ""  << @first_input.longer_descriptor << " With Optional " << @first_input.option_descriptor.split(", ")[0..-1].join(" or ").to_s << " from " << @first_input.biz_name << " Up to $max Off"
			elsif @first_input.multoption_types == "Complicated"
				@title = "" << @first_input.longer_descriptor << " from " << @first_input.biz_name << "(Up to $max Off). " << Article::NUMERALS[@first_input.num_options] << " Options Available."
			end
	end

  # GET /first_inputs/1
  # GET /first_inputs/1.json

	
  # GET /first_inputs/new
  def new
    @first_input = FirstInput.new
  end

  # GET /first_inputs/1/edit
  def edit
  end


  # POST /first_inputs
  # POST /first_inputs.json
  def create
    @first_input = FirstInput.new(first_input_params)

    respond_to do |format|
      if @first_input.save
        format.html { redirect_to @first_input, notice: 'First input was successfully created.' }
        format.json { render :show, status: :created, location: @first_input }
      else
        format.html { render :new }
        format.json { render json: @first_input.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /first_inputs/1
  # PATCH/PUT /first_inputs/1.json
  def update
    respond_to do |format|
      if @first_input.update(first_input_params)
        format.html { redirect_to @first_input, notice: 'First input was successfully updated.' }
        format.json { render :show, status: :ok, location: @first_input }
      else
        format.html { render :edit }
        format.json { render json: @first_input.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /first_inputs/1
  # DELETE /first_inputs/1.json
  def destroy
    @first_input.destroy
    respond_to do |format|
      format.html { redirect_to first_inputs_url, notice: 'First input was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_first_input
      @first_input = FirstInput.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def first_input_params
      params.require(:first_input).permit(:num_options, :deal_type, :biz_name, :longer_descriptor, :multi_voucher, :multoption_types, :optionals, :option_descriptor, :option_multiplier)
    end
end
