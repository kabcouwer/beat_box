class BeatBox
  attr_accessor :list, :rate, :voice

  def initialize
    @list = LinkedList.new
    @rate = 500
    @voice = 'Boing'
  end

  def append(data)
    data.split.each do |value|
      @list.append(value)
    end
    data
  end

  def count
    @list.count
  end

  def play
    beats = @list.to_string
    `say -r #{rate} -v #{voice} #{beats}`
    count
  end

  def reset_rate
    @rate = 500
  end

  def reset_voice
    @voice = 'Boing'
  end
end