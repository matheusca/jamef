module Jamef
  class Tax
    attr_accessor :cubage, :region, :cnpj, :cep, :uf

    URL = "http://www.jamef.com.br/internet/e-comerce/calculafrete_xml.asp"
    XPATH = "//transporte/frete"
    
    def initialize(cubage=nil, cnpj=nil, region=nil, cep=nil, uf=nil)
      @cubage = cubage
      @region = region.to_s
      @cnpj = cnpj
      @cep = cep
      @uf = uf
    end

    def get
      raise Errors::NoClassArg.new if self.cubage.nil?

      node = Nokogiri::XML(get_xml)
      code = node.xpath("#{XPATH}/status").first.text
      
      if code.to_i == 2
        raise NoCarriage.new
      else
        node.xpath("#{XPATH}/valor").first.text.sub(",", ".").to_f
      end
    end

    private

    def get_xml
      puts params
      RestClient.get(URL, {:params => params}).to_str
    end

    def params
      {
        P_CIC_NEGC: self.cnpj,
        P_CEP: self.cep,
        P_VLR_CARG: cubage.price.to_s.gsub(",", "."),
        P_PESO_KG: self.cubage.weight.to_s.gsub(",", "."),
        P_CUBG: cubage.to_s.gsub(",", "."),
        P_COD_REGN: self.region.to_s,
        P_UF: self.uf
      }
    end
  end
end
