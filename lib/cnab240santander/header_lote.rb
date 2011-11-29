module Cnab240santander
  class HeaderLote < Cnab240santander::Base
    def self.processar(linha)
      vlinha = Hash.new
      vlinha["banco"]                  = linha[0..2] #NUMERICO //Código do Banco na Compensação
      vlinha["lote"]                   = linha[3..6] #num //Numero do lote retorno
      vlinha["registro"]               = linha[7..7] #num //Tipo de registro
      vlinha["operacao"]               = linha[8..8] #alfa //Tipo de operação - T
      vlinha["servico"]                = linha[9..10] #num //Tipo de serviço - 01
      vlinha["res_banco1"]             = linha[11..12] #alfa //Reservado (uso Banco) - Brancos
      vlinha["layout_lote"]            = linha[13..15] #num  //No da versão do layout do lote - 040
      vlinha["res_banco2"]             = linha[16..16] #alfa //Reservado (uso Banco) - Brancos
      vlinha["tipo_inscricao"]         = linha[17..17] #num  //Tipo de inscrição da empresa - 1 = CPF, 2 = CNPJ
      vlinha["numero_inscricao"]       = linha[18..32] #num  //No de inscrição da empresa
      vlinha["codigo_cedente"]         = linha[33..41] #num  //Código do Cedente
      vlinha["res_banco3"]             = linha[42..52] #alfa //Reservado (uso Banco) - Brancos
      vlinha["agencia_ced"]            = linha[53..56] #num //Agência do Cedente
      vlinha["dv_agencia_ced"]         = linha[57..57] #num //Dígito da Agência do Cedente
      vlinha["conta_ced"]              = linha[58..66] #num //Número da conta do Cedente
      vlinha["dv_conta_ced"]           = linha[67..67] #num //Dígito verificador da conta
      vlinha["res_banco4"]             = linha[68..72] #alfa //Reservado (uso Banco) - Brancos
      vlinha["nome_empresa"]           = linha[73..102] #alfa //Nome da empresa
      vlinha["res_banco5"]             = linha[103..182] #alfa //Reservado (uso Banco) - Branco
      vlinha["numero_retorno"]         = linha[183..190] #num //Número do Retorno
      vlinha["data_remessa"]           = formataData(linha[191..198]) #num //Data da gravação remessa/retorno - DDMMAAAA
      vlinha["res_banco6"]             = linha[199..239] #brancos //Uso Exclusivo FEBRABAN / CNAB
      
      return vlinha
    end
  end
end