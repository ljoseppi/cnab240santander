module Cnab240santander
  class HeaderArquivo < Cnab240santander::Base
    def self.processar(linha)
      vlinha = Hash.new
      vlinha["banco"]                  = linha[0..2] #num //Código do Banco na Compensação
      vlinha["lote"]                   = linha[3..6] #num - default 0000 //Lote de Serviço
      vlinha["registro"]               = linha[7..7] #num - default 0 //Tipo de Registro
      vlinha["res_banco1"]             = linha[8..15] #alfa //Reservado (uso Banco) - Brancos
      vlinha["tipo_inscricao_empresa"] = linha[16..16] #num //Tipo de Inscrição da Empresa
      vlinha["num_inscricao_empresa"]  = linha[17..31] #num  //Número de Inscrição da Empresa
      vlinha["agencia"]                = linha[32..35] #num  //Agência do Cedente
      vlinha["dv_agencia"]             = linha[36..36] #num //Dígito da Agência do Cedente
      vlinha["conta_corrente"]         = linha[37..45] #num //Número da conta corrente
      vlinha["dv_conta"]               = linha[46..46] #num //DV da Conta Corrent
      vlinha["res_banco2"]             = linha[47..51] #alfa  //Reservado (uso Banco) - Brancos
      vlinha["cod_cedente"]            = linha[52..60] #num //Código do Cedente
      vlinha["res_banco3"]             = linha[61..71] #alfa //Reservado (uso Banco) - Brancos
      vlinha["nome_empresa"]           = linha[72..101] #alfa //Nome da empresa
      vlinha["nome_banco"]             = linha[102..131] #alfa //Nome do Banco
      vlinha["res_banco4"]             = linha[132..141] #alfa //Reservado (uso Banco) - Brancos
      vlinha["cod_retorno"]            = linha[142..142] #num - Código remessa / retorno
      vlinha["data_geracao_arq"]       = linha[143..150] #num - Data de geração do arquivo - DDMMAAAA
      vlinha["res_banco5"]             = linha[151..156] #alfa //Reservado (uso Banco) - Brancos
      vlinha["sequencia"]              = linha[157..162] #num //No seqüencial do arquivo
      vlinha["versao"]                 = linha[163..165] #num //No da versão do layout do arquivo
      vlinha["res_banco6"]             = linha[166..239] #alfa //Reservado (uso Banco) - Brancos
      
      return vlinha
    end
  end
end