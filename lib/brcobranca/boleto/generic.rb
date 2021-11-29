# -*- encoding: utf-8 -*-
#
# @author Victor Campos
module Brcobranca
  module Boleto
    class Generic < Base # Banco Santander
      # <b>REQUERIDO</b>: Informar qual o banco que se trata
      attr_accessor :banco
      # <b>REQUERIDO</b>: Informar qual o fator de vencimento
      attr_accessor :fator_vencimento
      # <b>REQUERIDO</b>: Informar qual o documento formatado
      attr_accessor :valor_documento_formatado
      # <b>REQUERIDO</b>: Informar qual o documento formatado
      attr_accessor :codigo_barras_segunda_parte
      # <b>REQUERIDO</b>: Informar qual o documento formatado
      attr_accessor :codigo_barras

      # Nova instancia do Santander
      # @param (see Brcobranca::Boleto::Base#initialize)
      def initialize(campos = {})
        super(campos)
      end

      def codigo_barras=(valor)
        self.banco = valor[0..2]
        self.moeda = valor[3..3]
        self.fator_vencimento = valor[5..8]
        self.valor_documento_formatado = valor[9..18]
        self.codigo_barras_segunda_parte = valor[19..43]
        @codigo_barras = valor
      end

      # Agência + codigo do cedente do cliente para exibir no boleto.
      # @return [String]
      # @example
      #  boleto.agencia_conta_boleto #=> "0059/1899775"
      def agencia_conta_boleto
        "#{agencia}/#{conta_corrente}"
      end

      def nosso_numero_boleto
        ''
      end

      def codigo_barras
        @codigo_barras
      end
    end
  end
end
