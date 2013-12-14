class RebanhosController < ApplicationController
  before_action :set_rebanho, only: [:show, :edit, :update, :destroy]
  before_action :set_menu

  # GET /rebanhos
  def index
    @rebanhos = Rebanho.all
  end

  # GET /rebanhos/new
  def new
    @rebanho = Rebanho.new
  end

  # GET /rebanhos/1/edit
  def edit
  end

  # POST /rebanhos
  def create
    @rebanho = Rebanho.new(rebanho_params)

    if @rebanho.save
      redirect_to edit_rebanho_path(@rebanho), notice: 'Rebanho criado com sucesso.'
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /rebanhos/1
  def update
    if @rebanho.update(rebanho_params)
      redirect_to rebanhos_path, notice: 'Rebanho atualizado com sucesso.'
    else
      render action: 'edit'
    end
  end

  # DELETE /rebanhos/1
  def destroy
    @rebanho.destroy
    redirect_to rebanhos_path, notice: 'Rebanho removido com sucesso.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_rebanho
      @rebanho = Rebanho.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def rebanho_params
      params.require(:rebanho).permit(:nome)
    end

    def set_menu
      @painel_ativo = :cadastros
      @menu_ativo   = :rebanhos
    end
end
