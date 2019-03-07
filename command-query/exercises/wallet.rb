class Wallet
  attr_accessor :cents
  def initialize
    @cents = 0
  end

  def <<(coin_type)
    case coin_type
    when :penny
      @cents += 1
    when :nickel
      @cents += 5
    when :dime
      @cents += 10
    when :quarter
      @cents += 25
    when :dollar
      @cents += 100
    end
  end

  def take(*coin_types)
    coin_types.each do |coin_type|
      case coin_type
      when :penny
        @cents -= 1 if @cents > 0
      when :nickel
        @cents -= 5 if @cents >= 5
      when :dime
        @cents -= 10 if @cents >= 10
      when :quarter
        @cents -= 25 if @cents >= 25
      when :dollar
        @cents -= 100 if @cents >= 100
      end
    end
  end
end
