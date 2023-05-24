class LinkedList
  attr_accessor :head

  def initialize
    @head = nil
  end

  def append(data)
    if @head
      find_tail.next_node = Node.new(data)
    else
      @head = Node.new(data)
    end
  end

  def find_tail
    current = @head

    if !current.next_node
      return current
    else
      current = current.next_node
    end
  end

  def prepend(data)
    current = @head
    @head = Node.new(data)

    if current.next_node
      append(current.data)
      current = current.next_node
    end
    append(current.data)
  end

  def insert(index, data)
    current = find_node(index)
    new_node = Node.new(data)

    if current.next_node
      new_node.next_node = current.next_node
    end
    current.next_node = new_node
  end

  def find_node(index)
    current = @head

    (index - 1).times do
      if current.next_node
        current = current.next_node
      end
    end
    return current
  end

  def count
    count = 0
    node = @head

    while node
      count += 1
      node = node.next_node
    end
    return count
  end

  def to_string
    string = ''
    node = @head

    while node
      string += node.data + ' '
      node = node.next_node
    end
    return string.rstrip
  end
end