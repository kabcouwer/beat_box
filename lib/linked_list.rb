class LinkedList
  attr_accessor :head

  def initialize
    @head = nil
  end

  def append(data)
    node = @head

    while node && node.next_node != nil
      node = node.next_node
    end

    if node
      node.next_node = Node.new(data)
    else
      @head = Node.new(data)
    end
  end

  def count
    count = 0
    node = @head

    while node != nil
      count += 1
      node = node.next_node
    end
    
    return count
  end

  def to_string
    string = ''
    node = @head

    while node != nil
      string += node.data + ' '
      node = node.next_node
    end

    return string.rstrip
  end
end