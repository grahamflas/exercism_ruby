require "pry"

class SimpleCalculator
  class UnsupportedOperation < StandardError; end

  def self.calculate(first_operand, second_operand, operation)
    self.check_valid_arguments(first_operand, second_operand)

    case operation
    when "+"
      result = first_operand + second_operand

      "#{first_operand} + #{second_operand} = #{result}"

    when "/"
      if second_operand != 0
        result = first_operand / second_operand

        "#{first_operand} / #{second_operand} = #{result}"
      else
        "Division by zero is not allowed."
      end

    when "*"
      result = first_operand * second_operand

      "#{first_operand} * #{second_operand} = #{result}"

    else
      raise UnsupportedOperation
    end
  end

  def self.check_valid_arguments(first_operand, second_operand)
    unless [first_operand, second_operand].all? { |arg| arg.is_a?(Integer)}
      raise ArgumentError
    end
  end

end
