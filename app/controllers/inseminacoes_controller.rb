class InseminacoesController < ApplicationController
  before_action :set_inseminacao, only: [:edit, :update, :destroy]
  before_action :set_menu

  # GET /inseminacoes
  def index
    @inseminacoes = Inseminacao.includes(:inseminador, :bovino).order('data desc, bovinos.nome asc')
  end

  # GET /inseminacoes/new
  def new
    @inseminacao = Inseminacao.new
  end

  # GET /inseminacoes/1/edit
  def edit
  end

  # POST /inseminacoes
  def create
    @inseminacao = Inseminacao.new(inseminacao_params)

    if @inseminacao.save
      redirect_to inseminacoes_path, notice: 'Inseminação criada com sucesso.'
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /inseminacoes/1
  def update
    if @inseminacao.update(inseminacao_params)
      redirect_to inseminacoes_path, notice: 'Inseminação atualizada com sucesso.'
    else
      render action: 'edit'
    end
  end

  # DELETE /inseminacoes/1
  def destroy
    @inseminacao.destroy
    redirect_to inseminacoes_path, notice: 'Inseminação removida com sucesso.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_inseminacao
      @inseminacao = Inseminacao.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def inseminacao_params
      params.require(:inseminacao).permit(:data, :inseminador_id, :bovino_id)
    end

    def set_menu
      @painel_ativo = :cadastros
      @menu_ativo   = :inseminacoes
    end
end
