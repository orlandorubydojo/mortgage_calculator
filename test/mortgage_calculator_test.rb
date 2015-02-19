require './test_helper'
require './lib/mortgage_calculator'

class MortgageCalculatorTest < Minitest::Test

  def setup
    @mc = MortgageCalculator.new(principal: 100000, interest_rate: 4, mortgage_period: 30)
  end

  def test_intance_of_calculator
    assert_instance_of MortgageCalculator, @mc
  end

  def test_should_take_arguments
    assert_equal 100000, @mc.principal
  end

  def test_interest_rate_has_value
    assert_equal 4, @mc.interest_rate
  end

  def test_mortgage_period_has_a_value
    assert_equal 30, @mc.mortgage_period
  end

  def test_monthly_interest_rate_has_a_value
    assert_in_delta 0.003333333, @mc.monthly_interest_rate, 0.000005
  end

  def test_number_of_payments_depends_on_mortgage_period
    assert_equal 360, @mc.number_of_payments
  end

  def test_term_depends_on_interest_rate_and_n_payments
    assert_in_delta 3.3134, @mc.term, 0.0001
  end

  def test_monthly_payment_depends_on_everything_else
    assert_in_delta 477.42, @mc.monthly_payment, 0.01
  end


end
