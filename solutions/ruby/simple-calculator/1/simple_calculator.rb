require "pry"

class SimpleCalculator
  ALLOWED_OPERATIONS = ['+', '/', '*'].freeze

  class UnsupportedOperation < StandardError; end

  def self.calculate(first_operand, second_operand, operation)
    if self.valid_arguments?(first_operand, second_operand)
      result =
        case operation
        when "+"
          first_operand + second_operand
        when "/"
          if second_operand != 0
            first_operand / second_operand
          else
            return "Division by zero is not allowed."
          end
        when "*"
          first_operand * second_operand
        else
          raise UnsupportedOperation
        end

      "#{first_operand} #{operation} #{second_operand} = #{result}"
    else
      raise ArgumentError
    end
  end

  def self.valid_arguments?(first_operand, second_operand)
    [first_operand, second_operand].all? { |arg| arg.is_a?(Integer)}
  end
end
