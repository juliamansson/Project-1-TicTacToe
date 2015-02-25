class Move < ActiveRecord::Base
  belongs_to :user
  belongs_to :match

  
  validate :if_match_is_active, on: :create
  validate :is_users_turn, on: :create
  validate :is_square_free, on: :create


  
  after_create :check_for_win
  # validate :check_for_draw
  


  def is_users_turn
    errors.add(:user_id, "it's not your turn!") unless match.whose_turn.id == user_id
  end

  def is_square_free
    errors.add(:square_id, "this square is already taken, try another one") if match.square_taken?(square_id)
  end

  def check_for_win
    match.match_won
  end

  def if_match_is_active
    errors.add(:match_id, "no more moves can be played") if !match.is_match_active?
  end

  # def check_for_draw
  #   errors.add(:match_id, "draw, game over") if match.match_draw?
  # end

end
