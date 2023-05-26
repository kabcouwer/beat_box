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

    while current.next_node
      current = current.next_node
    end
    current
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
    current = find_node(index - 1)
    new_node = Node.new(data)

    if current.next_node
      new_node.next_node = current.next_node
    end
    current.next_node = new_node
  end

  def find_node(index)
    current = @head

    index.times do
      if current.next_node
        current = current.next_node
      end
    end
    current
  end

  def count
    count = 0
    current = @head

    while current
      count += 1
      current = current.next_node
    end
    count
  end

  def to_string
    string = ''
    current = @head

    while current
      string += current.data + ' '
      current = current.next_node
    end
    string.rstrip
  end

  def find(index, num)
    current = find_node(index)
    string = ''

    num.times do
      string += current.data + ' '
      current = current.next_node
    end
    string.rstrip
  end

  def includes?(value)
    to_string.include?(value)
  end

  def pop
    tail = find_tail
    current = @head

    while current.next_node != tail
      current = current.next_node
    end
    current.next_node = nil
    tail.data
  end
end