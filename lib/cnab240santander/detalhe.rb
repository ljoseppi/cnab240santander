module Cnab240santander
  class Detalhe < Base
    def self.processar(linha, segmento)
      vlinha = Hash.new

      if segmento == "T"
          #Controle
          vlinha["banco"]                   = linha[0..2] #   Num //Codigo no Banco da Compensacao
          vlinha["lote"]                    = linha[3..6] #   Num //Numero do lote retorno
          vlinha["registro"]                = linha[7..7] #   Num  //Tipo de Registro - 3
          #Servico
          vlinha["num_registro_lote"]       = linha[8..12] #   Num  //No sequencial do registro no lote
          vlinha["segmento"]                = linha[13..13] #   Alfa  //Codigo de Segmento no Reg. Detalhe - T
          vlinha["res_banco1"]              = linha[14..14] #   Alfa //Reservado (uso Banco) - Brancos
          vlinha["cod_movimento"]           = linha[15..16] #   Num  //Codigo de movimento (ocorrencia)
          vlinha["agencia_ced"]             = linha[17..20] #   Num  //Agencia do Cedente
          vlinha["dv_agencia_ced"]          = linha[21..21] #   Num  //Digito da Agencia do Cedente
          vlinha["conta_ced"]               = linha[22..30] #   Num  //Numero da conta corrente
          vlinha["dv_conta_ced"]            = linha[31..31] #   Num  //Digito verificador da conta
          vlinha["res_banco2"]              = linha[32..39] #   Alfa //Reservado (uso Banco) - Brancos
          vlinha["nosso_numero"]            = linha[40..52] #   Num  //Identificacao do titulo no Banco - Nosso numero
          vlinha["cod_carteira"]            = linha[53..53] #   Num  //Codigo da carteira
          vlinha["seu_numero"]              = linha[54..68] #   Alfa  //No do documento de cobranca - Seu numero
          vlinha["data_venc_titulo"]        = formataData(linha[69..76]) #   Num  //Data do vencimento do titulo - DDMMAAAA
          vlinha["valor_nominal"]           = preparaMoeda(linha[77..91], 2) #   Num  //Valor nominal do titulo - 2 decimais
          vlinha["banco_cobrador"]          = linha[92..94] #   Num  //No do Banco Cobrador / Recebedor
          vlinha["ag_cobradora"]            = linha[95..98] #   Num  //Agencia Cobradora / Recebedora
          vlinha["dig_ag_cobradora"]        = linha[99..99] #   Num  //Digito da Agencia do Cobradora
          vlinha["id_titulo"]               = linha[100..124] #   Alfa  //Identif. do titulo na empresa
          vlinha["cod_moeda"]               = linha[125..126] #   Num  //Codigo da moeda
          vlinha["tipo_inscricao_sacado"]   = linha[127..127] #   Num  //Tipo de inscricao sacado - 1 =CPF, 2 = CNPJ
          vlinha["num_inscricao_sacado"]    = linha[128..142] #   Num  //Numero de inscricao sacado
          vlinha["nome_sacado"]             = linha[143..182] #   Alfa  //Nome do Sacado
          vlinha["conta_cobranca"]          = linha[183..192] #   Alfa //Conta Cobranca
          vlinha["valor_tarifa"]            = preparaMoeda(linha[193..207], 2) #   Num  //Valor da Tarifa/Custas
          vlinha["rejeicoes"]               = linha[208..217] #   Alfa  //Identificacao para rejeicoes, tarifas, custas, liquidacoes e baixas,
                                                            # ocorre 5 vezes, sendo que cada ocorrencia ocupa 02 digitos.
          vlinha["res_banco3"]              = linha[218..239] #   Alfa //Reservado (uso Banco) - Brancos

      elsif segmento == "U"

          #Controle
          vlinha["banco2"]                  = linha[0..2] #   Num //Codigo do Banco na Compensacao
          vlinha["lote2"]                   = linha[3..6] #   Num //Lote de Servico
          vlinha["registro2"]               = linha[7..7] #   Num default '3'//Registro detalhe
          #Servico
          vlinha["num_registro_lote2"]      = linha[8..12] #   Num  //No Sequencial do Registro no Lote
          vlinha["segmento2"]               = linha[13..13] #   Alfa  //Cod. segmento do registro detalhe - U
          vlinha["res_banco4"]              = linha[14..14] #   Alfa //Reservado (uso Banco) - Brancos
          vlinha["cod_movimento2"]          = linha[15..16] #   Num  //Codigo de movimento (ocorrencia)
          #Valores
          vlinha["juros_multa_encargos"]    = preparaMoeda(linha[17..31], 2) #   Num  //Juros / Multa / Encargos - 2 decimais
          vlinha["valor_desconto"]          = preparaMoeda(linha[32..46], 2) #   Num  //Valor do desconto concedido - 2 decimais
          vlinha["valor_abatimento"]        = preparaMoeda(linha[47..61], 2) #   Num  //Valor do Abatimento Concedido/Cancelado - 2 decimais
          vlinha["valor_iof"]               = preparaMoeda(linha[62..76], 2) #   Num  //Valor do IOF recolhido - 2 decimais
          vlinha["valor_pago"]              = preparaMoeda(linha[77..91], 2) #   Num  //Valor pago pelo sacado - 2 decimais
          vlinha["valor_liquido"]           = preparaMoeda(linha[92..106], 2) #   Num  //Valor liquido a ser creditado - 2 decimais
          vlinha["valor_despesas"]          = preparaMoeda(linha[107..121], 2) #   Num  //Valor de outras despesas - 2 decimais
          vlinha["valor_creditos"]          = preparaMoeda(linha[122..136], 2) #   Num  //Valor de outros creditos - 2 decimais
          #Ocorrencia
          vlinha["data_ocorrencia"]         = formataData(linha[137..144]) #   Num  //Data da ocorrencia - DDMMAAAA
          vlinha["data_credito"]            = formataData(linha[145..152]) #   Num  //Data da efetivacao do credito  - DDMMAAAA
          vlinha["cod_ocorrencia_sacado"]   = linha[153..156] #   Num  //Codigo da ocorrencia do sacado
          vlinha["data_ocorrencia_sacado"]  = formataData(linha[157..164]) #   Num  //Data da ocorrencia do sacado  - DDMMAAAA
          vlinha["valor_ocorrencia_sacado"] = preparaMoeda(linha[165..179], 2) #   Num  //Valor da ocorrencia do sacado  - 2 decimais
          vlinha["comp_ocorrencia_sacado"]  = linha[180..209] #   Alfa  //Complemento da ocorrencia do sacado
          vlinha["banco_compensacao"]       = linha[210..212] #   Num  //Codigo do Banco correspondente compens.
          vlinha["res_banco5"]              = linha[213..239] #   Alfa //Reservado (uso Banco) - Brancos
      end

      return vlinha
    end
  end
end