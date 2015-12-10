require 'pry'

class FileReader

  def read(filename)
    File.read(filename).chomp
  end

end

class Node
  attr_accessor :data, :left_link, :right_link, :level

  def initialize(data, left_link = nil, right_link = nil)
    @data = data

  end

end


class BinarySearchTree
  attr_accessor  :root

    def initialize
      @root = nil
    end

    def load(filename)
      s = FileReader.new.read(filename)
      s.split.each do |d|
          insert(d)
        end
    end

    def insert(data)
      node = Node.new(data)
      if root.nil?
        @root = node
      else
        push(root, node)
      end
    end

    def include?(data)
      if root.nil?
        return false
      else
        look_for_data(root, data)
      end
    end

    def depth_of(data)
      if root.nil?
        return 0
      else
        look_for_depth(root, data)
      end
    end

    def max
      if @root.right_link.nil?
        return @root.data
      else
        look_for_max(root)
      end
    end

    def min
      if @root.left_link.nil?
        return @root.data
      else
        look_for_min(root)
      end
    end

    def sort
      if @root.left_link.nil? && @root.right_link.nil?
        return [@root.data]
      else
        sort_tree_to_array(root)
      end
    end



    private

    def push(current, node)
      return if include?(node.data)
      if current.data < node.data
        right_way(current, node)
      else
        left_way(current, node)
      end
    end

    def right_way(current, node)
      if current.right_link.nil?
        current.right_link = node
      else
        current = current.right_link
        push(current, node)
      end
    end

    def left_way(current, node)
      if current.left_link.nil?
        current.left_link = node
      else
        current = current.left_link
        push(current, node)
      end
    end

    def look_for_data(current, data)
      if current.data == data
        return true
      elsif current.data < data && !current.right_link.nil?
        look_for_data(current.right_link, data)
      elsif current.data > data && !current.left_link.nil?
        look_for_data(current.left_link, data)
      else
        return false
      end
    end

    def look_for_depth(current, data, counter = 0)
      if current.data == data
        return counter
      elsif current.data < data && !current.right_link.nil?
        counter += 1
        look_for_depth(current.right_link, data, counter)
      elsif current.data > data && !current.left_link.nil?
        counter += 1
        look_for_depth(current.left_link, data, counter)
      end
    end

    def look_for_max(current)
      if current.right_link.nil?
        return current.data
      else
        current = current.right_link
        look_for_max(current)
      end
    end

    def look_for_min(current)
      if current.left_link.nil?
        return current.data
      else
        current = current.left_link
        look_for_min(current)
      end
    end

    def sort_tree_to_array(current, sorted_array = [])
      if current.left_link.nil? && current.right_link.nil?
        sorted_array << current.data
      else
        check_left(current, sorted_array)
        sorted_array << current.data
        check_right(current, sorted_array)
      end
      return sorted_array
    end

    def check_left(current, sorted_array)
      if !current.left_link.nil?
        current = current.left_link
        sort_tree_to_array(current, sorted_array)
      end
    end

    def check_right(current, sorted_array)
      if !current.right_link.nil?
        current = current.right_link
        sort_tree_to_array(current, sorted_array)
      end
    end

end
