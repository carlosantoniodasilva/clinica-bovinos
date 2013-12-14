class Rebanhos::BovinosController < ApplicationController
  before_action :set_rebanho
  before_action :set_bovino, only: [:create, :destroy]
  before_action :set_menu

  def index
    @bovinos = Bovino.where.not(id: @rebanho.bovinos.pluck(:id))
  end

  def create
    @rebanho.bovinos << @bovino
    redirect_to :back, notice: 'Bovino adicionado no rebanho com sucesso.'
  end

  def destroy
    @rebanho.bovinos.delete(@bovino)
    redirect_to :back, notice: 'Bovino removido do rebanho com sucesso.'
  end

  private
    def set_rebanho
      @rebanho = Rebanho.find(params[:rebanho_id])
    end

    def set_bovino
      @bovino = Bovino.find(params[:id])
    end

    def set_menu
      @painel_ativo = :cadastros
      @menu_ativo   = :rebanhos
    end
end
