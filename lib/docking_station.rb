require_relative 'bike'

class DockingStation
  DEFAULT_CAPACITY = 20
  attr_accessor :capacity

  def initialize(capacity = DEFAULT_CAPACITY)
    @bikes = []
    @capacity = capacity
  end

  def release_bike
    if empty?
      fail "No bikes available"
    else bmx = bikes.select { |bike| bike.working? }.pop
      if bmx.nil?
         fail "Can't release broken bike"
      else
         bmx
      end
      bikes.delete bmx
    end
  end

  def dock(bike)
    fail "It is full" if full?
    bikes << bike
  end

  private

  attr_reader :bikes

  def full?
    bikes.length >= DEFAULT_CAPACITY
  end

  def empty?
    bikes.length == 0
  end
end

