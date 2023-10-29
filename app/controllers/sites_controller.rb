class SitesController < ApplicationController
  before_action :set_local_record, only: %i[ show edit update destroy ]

  # GET /sites or /sites.json
  def index
    @sites = Site.all
  end

  # GET /sites/1 or /sites/1.json
  def show
  end

  # GET /sites/new
  def new
    @site = Site.new
  end

  # GET /sites/1/edit
  def edit
  end

  # POST /sites or /sites.json
  def create
    @site = Site.new(local_record_params)

    respond_to do |format|
      if @site.save
        format.html { redirect_to local_record_url(@site), notice: "Local record was successfully created." }
        format.json { render :show, status: :created, location: @site }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @site.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sites/1 or /sites/1.json
  def update
    respond_to do |format|
      if @site.update(local_record_params)
        format.html { redirect_to local_record_url(@site), notice: "Local record was successfully updated." }
        format.json { render :show, status: :ok, location: @site }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @site.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sites/1 or /sites/1.json
  def destroy
    @site.destroy

    respond_to do |format|
      format.html { redirect_to local_records_url, notice: "Local record was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_local_record
    @site = Site.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def local_record_params
    params.require(:site).permit(:name)
  end
end
