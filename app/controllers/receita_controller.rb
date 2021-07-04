class ReceitaController < ApplicationController
  before_action :set_receitum, only: %i[ show edit update destroy ]

  # GET /receita or /receita.json
  def index
    @receita = Receitum.all
  end

  # GET /receita/1 or /receita/1.json
  def show
  end

  # GET /receita/new
  def new
    @receitum = Receitum.new
  end

  # GET /receita/1/edit
  def edit
  end

  # POST /receita or /receita.json
  def create
    @receitum = Receitum.new(receitum_params)

    respond_to do |format|
      if @receitum.save
        format.html { redirect_to @receitum, notice: "Receitum was successfully created." }
        format.json { render :show, status: :created, location: @receitum }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @receitum.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /receita/1 or /receita/1.json
  def update
    respond_to do |format|
      if @receitum.update(receitum_params)
        format.html { redirect_to @receitum, notice: "Receitum was successfully updated." }
        format.json { render :show, status: :ok, location: @receitum }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @receitum.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /receita/1 or /receita/1.json
  def destroy
    @receitum.destroy
    respond_to do |format|
      format.html { redirect_to receita_url, notice: "Receitum was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_receitum
      @receitum = Receitum.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def receitum_params
      params.require(:receitum).permit(:valor)
    end
end
