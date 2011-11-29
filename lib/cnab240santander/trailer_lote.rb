module Cnab240santander
  class TrailerLote < Cnab240santander::Base
    def self.processar(linha)
      vlinha = Hash.new
      vlinha["banco"]                              = linha[0..2] #Num //Código do Banco na Compensação - 353 / 008 / 033
      vlinha["lote"]                               = linha[3..6] #Num //Lote de Serviço
      vlinha["registro"]                           = linha[7..7] #Num //Tipo de Registro - 5
      vlinha["res_banco1"]                         = linha[8..16] #Alfa //Reservado (uso Banco) - Brancos
      vlinha["qtde_registros"]                     = linha[17..22] #Num  //Quantidade de registros do lote
      vlinha["qtde_titulos_cobranca_simples"]      = linha[23..28] #Num  //Quantidade títulos cobrança simples
      vlinha["valor_titulos_cobranca_simples"]     = preparaMoeda(linha[29..45], 2) #Num  //Valor total dos títulos cobrança simples - 2 decimais
      vlinha["qtde_titulos_cobranca_vinculada"]    = linha[46..51] #Num  //Quantidade de títulos em cobrança vinculada
      vlinha["valor_titulos_cobranca_vinculada"]   = preparaMoeda(linha[52..68], 2) #Num  //Valor total dos títulos em cobrança vinculada - 2 decimais
      vlinha["qtde_titulos_cobranca_caucionada"]   = linha[69..74] #Num  //Quantidade de títulos em cobrança caucionada
      vlinha["valor_titulos_cobranca_caucionada"]  = preparaMoeda(linha[75..91], 2) #Num  //Valor total dos títulos em cobrança caucionada  - 2 decimais
      vlinha["qtde_titulos_cobranca_descontada"]   = linha[92..97] #Num  //Quantidade de títulos em cobrança descontada
      vlinha["valor_titulos_cobranca_descontada"]  = preparaMoeda(linha[98..114], 2) #Num  //Valor total dos títulos em cobrança descontada  - 2 decimais
      vlinha["num_aviso_lancamento"]               = linha[115..122] #Alfa  //Número do aviso de lançamento
      vlinha["res_banco2"]                         = linha[123..239] #Alfa //Reservado (uso Banco) - Branco
      
      return vlinha
    end
  end
end