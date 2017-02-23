class Node
  attr_reader :data
  attr_accessor :next

  def initialize(data, next_node)
    @data = data
    @next = next_node
  end

end

class LinkedList
  attr_accessor :head

  def initialize(head)
    @head = Node.new(head, nil)
  end

  def index_at(index)
    node_to_return = self.head
    index.times do |x|
       if node_to_return.next
         node_to_return = node_to_return.next
       else
         return nil
       end
    end
    node_to_return.data
  end

  def fill_in_empties(index)
    index.times do |i|
      if !node_at_index(i)
        new_node = nil
        if node_at_index(i + 1)
          new_node = Node.new(nil, node_at_index(i + 1))
        else
          new_node = Node.new(nil, nil)
        end
        node_at_index(i - 1).next = new_node
      end
    end
  end

  def node_at_index(index)
    node_to_return = self.head
    index.times do |x|
       if node_to_return.next
         node_to_return = node_to_return.next
       else
         return nil
       end
    end
    node_to_return
  end

  def insert_at_index(index, data)
    fill_in_empties(index)
    node_to_insert = Node.new(data, node_at_index(index))
    node_at_index(index - 1).next = node_to_insert
    node_to_insert.data
  end

  def unshift(data)
    new_node = Node.new(data, self.head)
    self.head = new_node
  end

  def push(data)
    index_node = self.head
    while index_node.next
      index_node = index_node.next
    end
    new_node = Node.new(data, nil)
    index_node.next = new_node
  end

end
