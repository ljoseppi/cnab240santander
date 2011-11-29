require "cnab240santander/version"

module Cnab240santander
  def self.retorno(path, retorna)
    Cnab240::Retorno.new(:path => path, :retorna => retorna)
  end
end
