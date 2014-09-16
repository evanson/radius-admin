class RadchecksController < ApplicationController
  before_action :set_radcheck, only: [:show, :edit, :update, :destroy]

  # GET /radchecks
  # GET /radchecks.json
  def index
    @radchecks = Radcheck.all
  end

  # GET /radchecks/1
  # GET /radchecks/1.json
  def show
  end

  # GET /radchecks/new
  def new
    @radcheck = Radcheck.new
  end

  # GET /radchecks/1/edit
  def edit
  end

  # POST /radchecks
  # POST /radchecks.json
  def create
    @radcheck = Radcheck.new(radcheck_params)
    @radcheck.op = ':='
    respond_to do |format|
      if @radcheck.save
        format.html { redirect_to @radcheck, notice: 'Radius user was successfully created.' }
        format.json { render :show, status: :created, location: @radcheck }
      else
        format.html { render :new }
        format.json { render json: @radcheck.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /radchecks/1
  # PATCH/PUT /radchecks/1.json
  def update
    respond_to do |format|
      if @radcheck.update(radcheck_params)
        format.html { redirect_to @radcheck, notice: 'Radius user was successfully updated.' }
        format.json { render :show, status: :ok, location: @radcheck }
      else
        format.html { render :edit }
        format.json { render json: @radcheck.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /radchecks/1
  # DELETE /radchecks/1.json
  def destroy
    @radcheck.destroy
    respond_to do |format|
      format.html { redirect_to radchecks_url, notice: 'Radius user was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_radcheck
      @radcheck = Radcheck.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def radcheck_params
      params.require(:radcheck).permit(:username, :attr, :value)
    end
end
