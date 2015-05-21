require 'spec_helper'

class TestCreditcard < TestModel
  validates :number, debitcard: true
end

module ActiveModel
  module Validations
    describe DebitcardValidator do
      before do
        TestCreditcard.reset_callbacks(:validate)
      end

      it "returns error message when debitcard number" do
        TestCreditcard.validates :number, debitcard: true
        creditcard = TestCreditcard.new(number: '4153141111111111')
        expect(creditcard.valid?).to be_falsey
        expect(creditcard.errors[:number]).to eq(["is debitcard."])
      end

      it "should be valid when creditcard string" do
        TestCreditcard.validates :number, debitcard: true
        creditcard = TestCreditcard.new(number: '4111111111111111')
        expect(creditcard.valid?).to be_truthy
        expect(creditcard.errors[:number]).to eq([])
      end

      it "should be valid when creditcard number (integer)" do
        TestCreditcard.validates :number, debitcard: true
        creditcard = TestCreditcard.new(number: 4111111111111111)
        expect(creditcard.valid?).to be_truthy
        expect(creditcard.errors[:number]).to eq([])
      end

      it "should be valid when creditcard number is nil" do
        TestCreditcard.validates :number, debitcard: true
        creditcard = TestCreditcard.new(number: nil)
        expect(creditcard.valid?).to be_truthy
        expect(creditcard.errors[:number]).to eq([])
      end

      it "returns error message when prepaidcard number" do
        TestCreditcard.validates :number, debitcard: true
        creditcard = TestCreditcard.new(number: '4284851111111111')
        expect(creditcard.valid?).to be_falsey
        expect(creditcard.errors[:number]).to eq(["is prepaidcard."])
      end
    end
  end
end
