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

      it "debitcard given" do
        TestCreditcard.validates :number, debitcard: true
        creditcard = TestCreditcard.new(number: '4153141111111111')
        expect(creditcard.valid?).to be_falsey
        expect(creditcard.errors[:number]).to eq(["is debitcard."])
      end
    end
  end
end
