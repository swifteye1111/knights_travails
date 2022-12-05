# frozen_string_literal: true

require_relative 'board'

# Knight class
class Knight
  attr_reader :position

  MOVES = [[-2, 1], [-1, 2], [1, 2], [2, 1], [2, -1], [1, -2], [-1, -2], [-2, -1]].freeze 

  def initialize(position = nil, parent = nil)
    @position = position
    @parent = parent
    build_moves
    p @child_moves
  end

  def build_moves
    @child_moves = []
    prospective_move = []
    MOVES.each do |move|
      prospective_move = [position[0] + move[0], position[1] + move[1]]
      @child_moves << prospective_move if prospective_move[0].between?(0, 7) && prospective_move[1].between?(0, 7)
    end
    # put each space into a tree and figure out which other spaces
    # are compatible with that space. IE build out a graph.
    # EG [0,0] can move to (is connected to) [1,2] and [2,1]
    # possibly...it works if the difference in sums of the two indices 
    # is exactly 3? Or is divisible by 3?
    # or maybe just have to add or subtract 1 or 2 from each num
  end
end