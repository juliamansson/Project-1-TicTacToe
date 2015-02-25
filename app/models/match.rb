class Match < ActiveRecord::Base
  has_many :moves
  belongs_to :user_x, class_name: 'User', foreign_key: 'user_x_id'
  belongs_to :user_o, class_name: 'User', foreign_key: 'user_o_id'
  belongs_to :winner, class_name: 'User'
  
  WINNING_COMBOS = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]

  # def new_match(user_x, user_o)
  #   Match.create(user_x_id: user_x, user_o_id: user_o)
  # end

  def make_move(user, position, value)
    moves.create!(user_id: user.id, square_id: position, value: value)
  end


  def assign_value(user)
    if user == user_x
      'x'
    else
      'o'
    end
  end


  def whose_turn
    if moves.last.try(:user_id) == user_x_id
      user_o
    else 
      user_x
    end
  end


  def move_for_square(square_id)
    moves.find_by(square_id: square_id)
  end

  def square_taken?(square_id)
    # moves.each do |move| 
    #   if square_id == move.square_id 
    #     return true 
    #   end
    # end
    # false 
    # end
    squares = moves.map { |move| move.square_id }
    squares.include? square_id
  end

  def position
    square_id = [0, 1, 2, 3, 4, 5, 6, 7, 8]
  end

  def user_moves(user)
    user.moves.map { |move| move.square_id if move.match_id == id}.compact
  end

  def match_won
    WINNING_COMBOS.each do |combo|
      if (user_moves(user_x) & combo).sort == combo.sort
        set_winner(user_x_id)
      elsif (user_moves(user_o) & combo).sort == combo.sort
        set_winner(user_o_id)
      end 
    end
  end


  def set_winner(user_id)
    self.winner_id = user_id
    save
  end


  def is_match_active?
    moves.count < 9 && self.winner_id.nil?
  end

  def is_match_finished?
    !is_match_active?
  end

  def is_match_drawn?
    moves.count == 9 && self.winner_id.nil?
  end

  # def match_draw?
  #   moves.count == 9 && self.winner_id.nil?
  # end

 




end
