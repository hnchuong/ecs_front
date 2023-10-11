class LocalRecordsController < ApplicationController
  before_action :set_local_record, only: %i[ show edit update destroy ]

  # GET /local_records or /local_records.json
  def index
    @local_records = LocalRecord.all
  end

  # GET /local_records/1 or /local_records/1.json
  def show
  end

  # GET /local_records/new
  def new
    @local_record = LocalRecord.new
  end

  # GET /local_records/1/edit
  def edit
  end

  # POST /local_records or /local_records.json
  def create
    @local_record = LocalRecord.new(local_record_params)

    respond_to do |format|
      if @local_record.save
        format.html { redirect_to local_record_url(@local_record), notice: "Local record was successfully created." }
        format.json { render :show, status: :created, location: @local_record }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @local_record.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /local_records/1 or /local_records/1.json
  def update
    respond_to do |format|
      if @local_record.update(local_record_params)
        format.html { redirect_to local_record_url(@local_record), notice: "Local record was successfully updated." }
        format.json { render :show, status: :ok, location: @local_record }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @local_record.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /local_records/1 or /local_records/1.json
  def destroy
    @local_record.destroy

    respond_to do |format|
      format.html { redirect_to local_records_url, notice: "Local record was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_local_record
      @local_record = LocalRecord.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def local_record_params
      params.require(:local_record).permit(:name)
    end
end
