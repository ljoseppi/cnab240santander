module Cnab240santander
  class TrailerArquivo < Cnab240santander::Base
    def self.processar(linha)
      vlinha = Hash.new
      vlinha["banco"]                  = linha[0..2] #num //Código do Banco na Compensação - 353 / 008 / 033
      vlinha["lote"]                   = linha[3..6] #num //Numero do lote remessa
      vlinha["registro"]               = linha[7..7] #num //Tipo de registro - 9
      vlinha["res_banco1"]             = linha[8..16] #alfa //Reservado (uso Banco) - Branco
      vlinha["qtde_lotes"]             = linha[17..22] #num  //Quantidade de lotes do arquivo - Registros tipo=1
      vlinha["qtde_registros"]         = linha[23..28] #num  //Quantidade de registros do arquivo - Registros tipo=0+1+3+5+9
      vlinha["res_banco2"]             = linha[29..239] #alfa //Reservado (uso Banco) - Branco

      return vlinha
    end
  end
end