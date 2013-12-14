class FazendasController < ApplicationController
  before_action :set_fazenda, only: [:edit, :update, :destroy]
  before_action :set_menu

  # GET /fazendas
  def index
    @fazendas = Fazenda.all
  end

  # GET /fazendas/new
  def new
    @fazenda = Fazenda.new
  end

  # GET /fazendas/1/edit
  def edit
  end

  # POST /fazendas
  def create
    @fazenda = Fazenda.new(fazenda_params)

    if @fazenda.save
      redirect_to fazendas_path, notice: 'Fazenda criada com sucesso.'
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /fazendas/1
  def update
    if @fazenda.update(fazenda_params)
      redirect_to fazendas_path, notice: 'Fazenda atualizada com sucesso.'
    else
      render action: 'edit'
    end
  end

  # DELETE /fazendas/1
  def destroy
    @fazenda.destroy
    redirect_to fazendas_path, notice: 'Fazenda removida com sucesso.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_fazenda
      @fazenda = Fazenda.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def fazenda_params
      params.require(:fazenda).permit(:nome)
    end

    def set_menu
      @painel_ativo = :cadastros
      @menu_ativo   = :fazendas
    end
end
