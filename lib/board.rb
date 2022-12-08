# frozen_string_literal: true

require_relative 'knight'

# Game board class
class Board
  def initialize(start_x, start_y, end_x, end_y)
    @root = Knight.new([start_x, start_y])
    print_path(trace_ancestry(navigate([end_x, end_y])))
  end

  private

  def navigate(end_position)
    knight_queue = [@root]
    current = knight_queue.shift
    until current.position == end_position
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

  def print_path(path)
    puts "#{path.reverse}"
    puts "You made it in #{path.length-1} moves!"
  end
end