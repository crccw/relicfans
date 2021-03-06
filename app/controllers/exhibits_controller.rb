class ExhibitsController < ApplicationController
  before_action :set_exhibit, only: [:show, :edit, :update, :destroy]

  # GET /exhibits
  # GET /exhibits.json
  def index
    @exhibits = Exhibit.all
  end

  # GET /exhibits/1
  # GET /exhibits/1.json
  def show
  end

  # GET /exhibits/new
  def new
    @exhibit = Exhibit.new
  end

  # GET /exhibits/1/edit
  def edit
  end

  # POST /exhibits
  # POST /exhibits.json
  def create
    @exhibit = Exhibit.new(exhibit_params)

    respond_to do |format|
      if @exhibit.save
        format.html { redirect_to @exhibit, notice: 'Exhibit was successfully created.' }
        format.json { render :show, status: :created, location: @exhibit }
      else
        format.html { render :new }
        format.json { render json: @exhibit.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /exhibits/1
  # PATCH/PUT /exhibits/1.json
  def update
    respond_to do |format|
      if @exhibit.update(exhibit_params)
        format.html { redirect_to @exhibit, notice: 'Exhibit was successfully updated.' }
        format.json { render :show, status: :ok, location: @exhibit }
      else
        format.html { render :edit }
        format.json { render json: @exhibit.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /exhibits/1
  # DELETE /exhibits/1.json
  def destroy
    @exhibit.destroy
    respond_to do |format|
      format.html { redirect_to exhibits_url, notice: 'Exhibit was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_exhibit
      @exhibit = Exhibit.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def exhibit_params
      params.require(:exhibit).permit(:name, :start_at, :end_at, :url, :museum_id)
    end
end
