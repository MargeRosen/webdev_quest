class QuestsController < ApplicationController
  before_action :authenticate_user!, :except => [:index, :show]

  def index
    @quests = Quest.all
  end

  def show
  end

  def new
    @quest = Quest.new
  end

  # GET /quests/1/edit
  def edit
  end

  def create
    @quest = Quest.new(quest_params)

    respond_to do |format|
      if @quest.save
        format.html { redirect_to @quest, notice: 'Question was save.' }
        format.json { render action: 'show', status: :created, location: @quest }
        redirect_to @quest
      else
        format.html { render action: 'new' }
        format.json { render json: @quest.errors, status: :unprocessable_entity }
        redirect_to :action => "new"
      end
    end
  end

  # PATCH/PUT /quests/1
  # PATCH/PUT /quests/1.json
  def update
    respond_to do |format|
      if @quest.update(quest_params)
        format.html { redirect_to @quest, notice: 'Question was updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @quest.errors, status: "Question update could not be processed" }
        redirect_to :action => "edit"
      end
    end
  end

  # DELETE /quests/1
  # DELETE /quests/1.json
  def destroy
    @quest.destroy
    respond_to do |format|
      format.html { redirect_to quests_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_quest
      @quest = Quest.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def quest_params
      params.require(:quest).permit(:question, :answer)
      params.require(:quest).permit(:question, :answer)
    end
end
