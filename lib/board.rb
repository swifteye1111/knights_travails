# frozen_string_literal: true

require_relative 'knight'

# Game board class
class Board
  attr_reader :spaces

  def initialize(x, y)
    @root = Knight.new([x, y])
    trace_ancestry(level_order_search).reverse
  end

  def level_order_search(target_position = [0, 0])
    knight_queue = [@root]
    current = knight_queue.shift
    until current.position == target_position
      current.moves.each do |move|
        current.children << knight = Knight.new(move, current)
        knight_queue << knight
      end
      current = knight_queue.shift
    end
    current
  end

  def trace_ancestry(knight, ancestors = [])
    until knight.position == @root.position
      ancestors << knight.position
      knight = knight.parent
    end
    ancestors << knight.position
  end

  def print_path
  end
end