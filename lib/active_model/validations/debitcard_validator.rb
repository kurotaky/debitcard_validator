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
      # SURUGA Bank: 421614,421615,421641,424417
      # e Bank Money CLASSIC: 454202
      # e Bank Money GOLD: 454203
      # Rakuten Debit: 454204
      # Resona Visa Debit: 454205
      # UFJ Debit: 462437,462438,462439
      # CALIFORNIA BANK & TRUST: 473063
      # UNION BANK OF CALIFORNIA: 540997
      # Japan Net Bank: 464988,467923,461935,464983,467925,467924
      # Suruga Visa Debit T Card: 461791
      # Mitsui Sumitomo ANA VISA: 470843
      # City National Bank of West Virginia - Gold Debit Matercard: 517895
      # SONY BANK Debit: 400142
      # Sumishin SBI Net Bank: 406054
      # Aosora Bank: 498779
      # Ryugin Visa Debit: 481520
      # United Bank Check Card (VISA Debit and Cirrus/STAR): 448775
      # E*trade VISA Debit: 479884
      #
      def debitcard_regexes
        /(^479884|^448775|^481520|^498779|^406054|^400142|^467924|^517895|^461791|^470843|^415314|^421614|^421615|^421641|^424417|^454202|^454203|^454204|^454205|^462437|^462438|^462439|^464988|^467923|^461935|^464983|^467925|^473063|^540997)/
      end

      # Prepaidcards
      #
      # V Preca: 428485,428486
      # NEO MONEY: 428487
      # Cocokara Club Card: 428490
      # AMEX GIFT Card: 379029
      # VISA Prepaid: 469186
      # Osaifu Ponta JCB: 357400
      # SBI Card: 462476
      # auWallet: 516645
      # J-WEST: 520858
      # Docomo Visa: 452018,452019
      # Mitsui Sumitomo Visa: 470838
      # Rakuten JCB Debit: 357300
      # Chibagin Super Card: 357361
      # LINE Pay JCB Prepaid Card: 357401
      # SOFTBANK CARD: 453287,433287
      #
      def prepaidcard_regexes
        /(^433287|^453287|^357401|^357361|^357300|^428485|^428486|^428487|^428490|^379029|^469186|^357400|^452018|^452019|^462476|^516645|^520858|^470838)/
      end

      def trim_number(value)
        value.to_s.gsub('-', '').gsub(' ', '') unless value.nil?
      end
    end
  end
end
