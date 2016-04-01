class Node
  attr_accessor :left_link, :right_link, :level
  attr_reader :data

  def initialize(data, left_link = nil, right_link = nil)
    @data = data
  end

end
