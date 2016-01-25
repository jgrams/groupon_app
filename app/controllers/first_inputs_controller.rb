class FirstInputsController < ApplicationController
  before_action :set_first_input, only: [:show, :edit, :update, :destroy]

#add a contact page
	def contact
  end

#add a about page
	def about
  end

  # GET /first_inputs
  # GET /first_inputs.json
  def index
    @first_inputs = FirstInput.all
  end

  # GET /first_inputs/1
  # GET /first_inputs/1.json
  def show
  	if @first_input.num_options == 1 && @first_input.deal_type == "Gen Spend" && @first_input.multi_voucher == false
  		gensped_oneoption
		elsif @first_input.num_options >= 2 && @first_input.deal_type == "Gen Spend" && @first_input.multi_voucher == false
		  genspend_multoption
  	elsif @first_input.num_options == 1 && @first_input.deal_type == "Product Deal" && @first_input.multi_voucher == false
			proddeal_oneoption
  	elsif @first_input.num_options >= 2 && @first_input.deal_type == "Product Deal" && @first_input.multi_voucher == false	
  		proddeal_multoption
  	
  	elsif @first_input.num_options == 1 && @first_input.deal_type == "Gen Spend" && @first_input.multi_voucher == true
  		@longer_descriptor = @first_input.longer_descriptor
  	
  	elsif @first_input.num_options >= 2 && @first_input.deal_type == "Gen Spend" && @first_input.multi_voucher == true
  		@longer_descriptor = @first_input.longer_descriptor
  	
  	elsif @first_input.num_options == 1 && @first_input.deal_type == "Product Deal" && @first_input.multi_voucher == true
  		@longer_descriptor = @first_input.longer_descriptor
  	
  	elsif @first_input.num_options >= 2 && @first_input.deal_type == "Product Deal" && @first_input.multi_voucher == true
  		@longer_descriptor = @first_input.longer_descriptor
  	end
  end

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