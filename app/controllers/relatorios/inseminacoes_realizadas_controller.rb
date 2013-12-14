class Relatorios::InseminacoesRealizadasController < ApplicationController
  before_action :set_menu

  def index
  end

  def create
    @bovino = Bovino.find_by_id(params[:bovino_id])

    if @bovino
      @inseminacoes = Inseminacao.where(bovino_id: @bovino).includes(:inseminador).order('data desc')
    else
      flash.now[:alert] = 'Por favor selecione um bovino para continuar.'
      render action: :index
    end
  end

  private
    def set_menu
      @painel_ativo = :relatorios
      @menu_ativo   = :inseminacoes_realizadas
    end
end
