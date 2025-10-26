require "pry"

class SimpleCalculator
  ALLOWED_OPERATIONS = ['+', '/', '*'].freeze

  class UnsupportedOperation < StandardError; end

  def self.calculate(first_operand, second_operand, operation)
    self.check_valid_operands(first_operand, second_operand)
    self.check_valid_operation(operation)

    begin
      result = first_operand.send(operation, second_operand)

      "#{first_operand} #{operation} #{second_operand} = #{result}"
    rescue ZeroDivisionError
      "Division by zero is not allowed."
    end
  end

  def self.check_valid_operands(first_operand, second_operand)
    unless first_operand.is_a?(Integer) && second_operand.is_a?(Integer)
      raise ArgumentError
    end
  end

  def self.check_valid_operation(operation)
    unless ALLOWED_OPERATIONS.include?(operation)
      raise UnsupportedOperation
    end
  end
end
