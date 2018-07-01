class NoticesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :correct_user, only: [:edit, :update, :destroy]
  before_action :set_notice, only: [:show, :edit, :update, :destroy]

  # GET /notices
  # GET /notices.json
  def index
    @notices = Notice.all.order('created_at DESC')
  end

  # GET /notices/1
  # GET /notices/1.json
  def show
  end

  # GET /notices/new
  def new
    @notice = current_user.notices.build
  end

  # GET /notices/1/edit
  def edit
  end

  # POST /notices
  # POST /notices.json
  def create
    @notice = current_user.notices.build(notice_params)

    respond_to do |format|
      if @notice.save
        format.html { redirect_to @notice, notice: 'Notice was successfully created.' }
        format.json { render :show, status: :created, location: @notice }
      else
        format.html { render :new }
        format.json { render json: @notice.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /notices/1
  # PATCH/PUT /notices/1.json
  def update
    respond_to do |format|
      if @notice.update(notice_params)
        format.html { redirect_to @notice, notice: 'Notice was successfully updated.' }
        format.json { render :show, status: :ok, location: @notice }
      else
        format.html { render :edit }
        format.json { render json: @notice.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /notices/1
  # DELETE /notices/1.json
  def destroy
    @notice.destroy
    respond_to do |format|
      format.html { redirect_to notices_url, notice: 'Notice was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_notice
      @notice = Notice.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def notice_params
      params.require(:notice).permit(:title, :body)
    end

    def correct_user
      @notice = current_user.notices.find_by(id: params[:id])
      redirect_to notices_path, notice: "No esta autorizado para editar este articulo" if @notice.nil?
    end
end
