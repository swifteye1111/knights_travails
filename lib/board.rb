# frozen_string_literal: true

require_relative 'knight'

# Game board class
class Board
  attr_reader :spaces

  def initialize(x, y)
    make_spaces
    @root = Knight.new([x, y])
    @spaces.delete([x, y])
    make_tree
  end

  def make_spaces
    x = 0
    @spaces = []
    while x < 8
      y = 0
      while y < 8
        @spaces << [x, y]
        y += 1
      end
      x += 1
    end
  end

  def make_tree(current = @root)
    return if @spaces.empty?

    current.moves.each do |move|
      if @spaces.include?([move[0], move[1]])
        current.children << Knight.new([move[0], move[1]], current) 
        @spaces.delete([move[0], move[1]])
      end
    end

    current.children.each { |child| make_tree(child) }
  end

  # def print_moves(knight = @root)
  #   return if knight.nil?

  #   p knight.position
  #   print_moves(knight.child_moves)
  # end
end