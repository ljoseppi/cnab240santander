["formatacao", "base", "retorno", "header_arquivo", "header_lote", "detalhe", "trailer_arquivo", "trailer_lote"].each do |f|
  require File.join(File.dirname(__FILE__), 'cnab240santander', f)
end

module Cnab240santander
  def self.retorno(path, retorna)
    Cnab240santander::Retorno.new(:path => path, :retorna => retorna)
  end
end
