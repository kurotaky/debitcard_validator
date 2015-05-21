require 'active_model/validations'

module ActiveModel
  module Validations
    class DebitcardValidator < ActiveModel::EachValidator
      def validate_each(record, attribute, value)
        value = trim_number(value)
        if value =~ debitcard_regexes
          record.errors.add(attribute, :is_debitcard || 'is debitcard.')
        end

        if value =~ prepaidcard_regexes
          record.errors.add(attribute, :is_prepaidcard || 'is prepaidcard.')
        end
      end

      private

      # Debitcards
      #
      # Nikko Platinum: 415314
      # SURUGA Bank: 421614,421615,421641
      # e Bank Money CLASSIC: 454202
      # e Bank Money GOLD: 454203
      # Resona Visa Debit: 454205
      # CALIFORNIA BANK & TRUST: 473063
      # UNION BANK OF CALIFORNIA: 540997
      #
      def debitcard_regexes
        /(^415314|^421614|^421615|^421641|^454202|^454203|^454205|^473063|^540997)/
      end

      # Prepaidcards
      #
      # V Preca: 428485
      # NEO MONEY: 428487
      # Cocokara Club Card: 428490
      # AMEX GIFT Card: 379029
      #
      def prepaidcard_regexes
        /(^428485|^428487|^428490|^379029)/
      end

      def trim_number(value)
        value.to_s.gsub('-', '').gsub(' ', '') unless value.nil?
      end
    end
  end
end
