# frozen_string_literal: true

require_relative 'board'

# Knight class
class Knight
  attr_reader :position, :moves, :parent
  attr_accessor :children

  MOVES = [[-2, 1], [-1, 2], [1, 2], [2, 1], [2, -1], [1, -2], [-1, -2], [-2, -1]].freeze 

  def initialize(position = nil, parent = nil)
    @position = position
    @parent = parent
    @children = []
    build_moves
  end

  def build_moves
    @moves = []
    prospective_move = []
    MOVES.each do |move|
      prospective_move = [position[0] + move[0], position[1] + move[1]]
      @moves << prospective_move if prospective_move[0].between?(0, 7) && prospective_move[1].between?(0, 7)
    end
  end
end