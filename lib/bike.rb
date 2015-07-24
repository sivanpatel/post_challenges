class Bike
  attr_reader :working

  def initialize
    @working = true
  end

  def report_broken
    @working = false
  end

  def working?
    @working
  end

  def broken?
    !working?
  end
end