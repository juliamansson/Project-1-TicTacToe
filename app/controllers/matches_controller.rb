class MatchesController < ApplicationController
  before_action :set_match, only: [:show, :edit, :update, :destroy, :move]

  # GET /matches
  # GET /matches.json
  def index
    @matches = current_user.matches
  end

  # GET /matches/1
  # GET /matches/1.json
  def show
  end

  # GET /matches/new
  def new
    @match = Match.new
    @users = User.order('name ASC') - [current_user]
  end


  def move
    authenticate_user!
    @move = Move.new(user_id: current_user.id, square_id: params[:square_id], value: @match.assign_value(current_user), match_id: @match.id)
    if @move.save
      redirect_to @match
    else
      render :show
    end
  end

  # GET /matches/1/edit
  def edit
  end

  # POST /matches
  # POST /matches.json
  def create
    @match = Match.new(match_params)
    @match.user_x = current_user
    @users = User.order('name ASC') - [current_user]

    respond_to do |format|
      if @match.save
        format.html { redirect_to @match, notice: 'Match was successfully created.' }
        format.json { render :show, status: :created, location: @match }
      else
        format.html { render :new }
        format.json { render json: @match.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /matches/1
  # PATCH/PUT /matches/1.json
  def update
    respond_to do |format|
      if @match.update(match_params)
        format.html { redirect_to @match, notice: 'Match was successfully updated.' }
        format.json { render :show, status: :ok, location: @match }
      else
        format.html { render :edit }
        format.json { render json: @match.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /matches/1
  # DELETE /matches/1.json
  def destroy
    @match.destroy
    respond_to do |format|
      format.html { redirect_to matches_url, notice: 'Match was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  
  # def add_move_to_game
  #   user = current_user
  #   match =  Match.find(params[:id])
  #   position = params[:position]
  #   match.add_move(user, match, position)
  # end



  private
    # Use callbacks to share common setup or constraints between actions.
    def set_match
      @match = Match.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def match_params
      params.require(:match).permit(:user_x_id, :user_o_id, :winner_id)
    end
end
