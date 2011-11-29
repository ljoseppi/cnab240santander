module Cnab240santander
  class Detalhe < Cnab240santander::Base
    def self.processar(linha, segmento)
      vlinha = Hash.new

      if segmento == "T"
          #Controle
          vlinha["banco"]                   = linha[0..2] #   Num //Código no Banco da Compensação     
          vlinha["lote"]                    = linha[3..6] #   Num //Numero do lote retorno
          vlinha["registro"]                = linha[7..7] #   Num  //Tipo de Registro - 3
          #Serviço                          
          vlinha["num_registro_lote"]       = linha[8..12] #   Num  //No sequencial do registro no lote
          vlinha["segmento"]                = linha[13..13] #   Alfa  //Código de Segmento no Reg. Detalhe - T
          vlinha["res_banco1"]              = linha[14..14] #   Alfa //Reservado (uso Banco) - Brancos
          vlinha["cod_movimento"]           = linha[15..16] #   Num  //Código de movimento (ocorrência)
          vlinha["agencia_ced"]             = linha[17..20] #   Num  //Agência do Cedente
          vlinha["dv_agencia_ced"]          = linha[21..21] #   Num  //Dígito da Agência do Cedente
          vlinha["conta_ced"]               = linha[22..30] #   Num  //Número da conta corrente
          vlinha["dv_conta_ced"]            = linha[31..31] #   Num  //Dígito verificador da conta
          vlinha["res_banco2"]              = linha[32..39] #   Alfa //Reservado (uso Banco) - Brancos
          vlinha["nosso_numero"]            = linha[40..52] #   Num  //Identificação do título no Banco - Nosso número
          vlinha["cod_carteira"]            = linha[53..53] #   Num  //Código da carteira
          vlinha["seu_numero"]              = linha[54..68] #   Alfa  //No do documento de cobrança - Seu número
          vlinha["data_venc_titulo"]        = formataData(linha[69..76]) #   Num  //Data do vencimento do título - DDMMAAAA
          vlinha["valor_nominal"]           = preparaMoeda(linha[77..91], 2) #   Num  //Valor nominal do título - 2 decimais
          vlinha["banco_cobrador"]          = linha[92..94] #   Num  //No do Banco Cobrador / Recebedor
          vlinha["ag_cobradora"]            = linha[95..98] #   Num  //Agência Cobradora / Recebedora
          vlinha["dig_ag_cobradora"]        = linha[99..99] #   Num  //Dígito da Agência do Cobradora
          vlinha["id_titulo"]               = linha[100..124] #   Alfa  //Identif. do título na empresa
          vlinha["cod_moeda"]               = linha[125..126] #   Num  //Código da moeda
          vlinha["tipo_inscricao_sacado"]   = linha[127..127] #   Num  //Tipo de inscrição sacado - 1 =CPF, 2 = CNPJ
          vlinha["num_inscricao_sacado"]    = linha[128..142] #   Num  //Número de inscrição sacado
          vlinha["nome_sacado"]             = linha[143..182] #   Alfa  //Nome do Sacado
          vlinha["conta_cobranca"]          = linha[183..192] #   Alfa //Conta Cobrança
          vlinha["valor_tarifa"]            = preparaMoeda(linha[193..207], 2) #   Num  //Valor da Tarifa/Custas
          vlinha["rejeicoes"]               = linha[208..217] #   Alfa  //Identificação para rejeições, tarifas, custas, liquidações e baixas,
                                                            # ocorre 5 vezes, sendo que cada ocorrência ocupa 02 dígitos.
          vlinha["res_banco3"]              = linha[218..239] #   Alfa //Reservado (uso Banco) - Brancos

      elsif segmento == "U"

          #Controle
          vlinha["banco2"]                  = linha[0..2] #   Num //Código do Banco na Compensação
          vlinha["lote2"]                   = linha[3..6] #   Num //Lote de Serviço
          vlinha["registro2"]               = linha[7..7] #   Num default '3'//Registro detalhe
          #Serviço
          vlinha["num_registro_lote2"]      = linha[8..12] #   Num  //No Sequencial do Registro no Lote
          vlinha["segmento2"]               = linha[13..13] #   Alfa  //Cód. segmento do registro detalhe - U
          vlinha["res_banco3"]              = linha[14..14] #   Alfa //Reservado (uso Banco) - Brancos
          vlinha["cod_movimento2"]          = linha[15..16] #   Num  //Código de movimento (ocorrência)
          #Valores
          vlinha["juros_multa_encargos"]    = preparaMoeda(linha[17..31], 2) #   Num  //Juros / Multa / Encargos - 2 decimais
          vlinha["valor_desconto"]          = preparaMoeda(linha[32..46], 2) #   Num  //Valor do desconto concedido - 2 decimais
          vlinha["valor_abatimento"]        = preparaMoeda(linha[47..61], 2) #   Num  //Valor do Abatimento Concedido/Cancelado - 2 decimais
          vlinha["valor_iof"]               = preparaMoeda(linha[62..76], 2) #   Num  //Valor do IOF recolhido - 2 decimais
          vlinha["valor_pago"]              = preparaMoeda(linha[77..91], 2) #   Num  //Valor pago pelo sacado - 2 decimais
          vlinha["valor_liquido"]           = preparaMoeda(linha[92..106], 2) #   Num  //Valor liquido a ser creditado - 2 decimais
          vlinha["valor_despesas"]          = preparaMoeda(linha[107..121], 2) #   Num  //Valor de outras despesas - 2 decimais
          vlinha["valor_creditos"]          = preparaMoeda(linha[122..136], 2) #   Num  //Valor de outros créditos - 2 decimais
          #Ocorrencia
          vlinha["data_ocorrencia"]         = formataData(linha[137..144]) #   Num  //Data da ocorrência - DDMMAAAA
          vlinha["data_credito"]            = formataData(linha[145..152]) #   Num  //Data da efetivação do crédito  - DDMMAAAA
          vlinha["cod_ocorrencia_sacado"]   = linha[153..156] #   Num  //Código da ocorrência do sacado
          vlinha["data_ocorrencia_sacado"]  = formataData(linha[157..164]) #   Num  //Data da ocorrência do sacado  - DDMMAAAA
          vlinha["valor_ocorrencia_sacado"] = preparaMoeda(linha[165..179], 2) #   Num  //Valor da ocorrência do sacado  - 2 decimais
          vlinha["comp_ocorrencia_sacado"]  = linha[180..209] #   Alfa  //Complemento da ocorrência do sacado
          vlinha["banco_compensacao"]       = linha[210..212] #   Num  //Código do Banco correspondente compens.
          vlinha["res_banco4"]              = linha[213..239] #   Alfa //Reservado (uso Banco) - Brancos
      end

      return vlinha
    end
  end
end