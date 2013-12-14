class BovinosController < ApplicationController
  before_action :set_bovino, only: [:edit, :update, :destroy]
  before_action :set_menu

  # GET /bovinos
  def index
    @bovinos = Bovino.all
  end

  # GET /bovinos/new
  def new
    @bovino = Bovino.new
  end

  # GET /bovinos/1/edit
  def edit
  end

  # POST /bovinos
  def create
    @bovino = Bovino.new(bovino_params)

    if @bovino.save
      redirect_to bovinos_path, notice: 'Bovino criado com sucesso.'
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /bovinos/1
  def update
    if @bovino.update(bovino_params)
      redirect_to bovinos_path, notice: 'Bovino atualizado com sucesso.'
    else
      render action: 'edit'
    end
  end

  # DELETE /bovinos/1
  def destroy
    @bovino.destroy
    redirect_to bovinos_path, notice: 'Bovino removido com sucesso.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bovino
      @bovino = Bovino.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def bovino_params
      params.require(:bovino).permit(
        :fazenda_id, :numero, :nome, :pai, :mae, :raca, :pelagem, :sexo, :data_nascimento)
    end

    def set_menu
      @painel_ativo = :cadastros
      @menu_ativo   = :bovinos
    end
end
