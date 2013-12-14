class InseminadoresController < ApplicationController
  before_action :set_inseminador, only: [:edit, :update, :destroy]
  before_action :set_menu

  # GET /inseminadores
  def index
    @inseminadores = Inseminador.all
  end

  # GET /inseminadores/new
  def new
    @inseminador = Inseminador.new
  end

  # GET /inseminadores/1/edit
  def edit
  end

  # POST /inseminadores
  def create
    @inseminador = Inseminador.new(inseminador_params)

    if @inseminador.save
      redirect_to inseminadores_path, notice: 'Inseminador criado com sucesso.'
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /inseminadores/1
  def update
    if @inseminador.update(inseminador_params)
      redirect_to inseminadores_path, notice: 'Inseminador atualizado com sucesso.'
    else
      render action: 'edit'
    end
  end

  # DELETE /inseminadores/1
  def destroy
    @inseminador.destroy
    redirect_to inseminadores_path, notice: 'Inseminador removido com sucesso.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_inseminador
      @inseminador = Inseminador.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def inseminador_params
      params.require(:inseminador).permit(:nome)
    end

    def set_menu
      @painel_ativo = :cadastros
      @menu_ativo   = :inseminadores
    end
end
