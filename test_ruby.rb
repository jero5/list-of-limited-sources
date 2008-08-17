
class TestFib

  def self.fib(n, a = 0, b = 1)
    __args__ = [b, a, n]
    __ret__ = nil
    __meth__ = :fib

    __shared__(__args__, __ret__, __meth__)
  end

  def self.__shared__(__args__, __ret__, __meth__)

    loop do

      case __meth__
      when :fib
        n = __args__.pop
        a = if __args__.empty?
              0
            else
              __args__.pop
            end
        b = if __args__.empty?
              1
            else
              __args__.pop
            end

        if n <= 0
          __ret__ = a
          __meth__ = nil
        else
          __args__ << (a + b)
          __args__ << b
          __args__ << (n - 1)
          __meth__ = :fib
        end
      else
        return __ret__
      end
    end
  end
end

class TestBounce

  def self.bounce0(n)
    __args__ = [n]
    __ret__ = nil
    __meth__ = :bounce0

    __shared__(__args__, __ret__, __meth__)
  end

  def self.bounce1(n)
    __args__ = [n]
    __ret__ = nil
    __meth__ = :bounce1

    __shared__(__args__, __ret__, __meth__)
  end

  def self.bounce2(n)
    __args__ = [n]
    __ret__ = nil
    __meth__ = :bounce2

    __shared__(__args__, __ret__, __meth__)
  end

  def self.__shared__(__args__, __ret__, __meth__)

    loop do

      case __meth__
      when :bounce0
        n = __args__.pop

        __args__ << (n - 1)
        __meth__ = :bounce1
      when :bounce1
        n = __args__.pop

        __args__ << (n - 1)
        __meth__ = :bounce2
      when :bounce2
        n = __args__.pop

        if n <= 0
          __ret__ = -999
          __meth__ = nil
        else
          __args__ << (n - 1)
          __meth__ = :bounce0
        end
      else
        return __ret__
      end
    end
  end
end

rgx = /\\ \ \//x
str = "\\ \ \""
flt = 10.8

num = 200_000

puts TestBounce.bounce0(num)
