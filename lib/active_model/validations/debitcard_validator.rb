require 'active_model/validations'

module ActiveModel
  module Validations
    class DebitcardValidator < ActiveModel::EachValidator
      def validate_each(record, attribute, value)
        value = trim_number(value)
        if value =~ debitcard_regexes
          return record.errors.add(attribute, 'is debitcard.')
        end
      end

      private
      def debitcard_regexes
        /(^415314|^421614|^421615|^454202|^454203|^454205|^473063|^540997)/
      end

      def trim_number(value)
        value.gsub('-', '').gsub(' ', '')
      end
    end
  end
end
