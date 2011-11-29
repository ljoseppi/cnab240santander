require "spec_helper"

describe "Cnab240santander" do
  it "should include ActiveSupport" do
    Object.class_eval { const_defined?("ActiveSupport") }.should be_true
  end
  
  it "should raise an exception when :path options is nil" do
    lambda {
      Cnab240santander.retorno()
    }.should raise_exception(Exception)
  end
  
  it "should return an array" do
    cnab = Cnab240santander.retorno(File.dirname(__FILE__)+"/../../RETORNO.TXT", nil)
    cnab.linhas.should be_kind_of(Array)
  end

  context "Header file" do
    it "should parse the header file" do
      cnab = Cnab240santander.retorno(File.dirname(__FILE__)+"/../../RETORNO.TXT", 0)
      cnab.linhas.should be_kind_of(Array)
    end
  end
end