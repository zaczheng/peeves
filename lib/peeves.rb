class Peeves
  
  # TEST_URL = 'https://ukvpstest.protx.com/vspgateway/service'
  # LIVE_URL = 'https://ukvps.protx.com/vspgateway/service'
  SIMULATOR_URL = 'https://ukvpstest.protx.com/VSPSimulator/VSPServerGateway.asp?Service=VendorRegisterTx'

  APPROVED = 'OK'
  
  TRANSACTIONS = {
    :purchase => 'PAYMENT',
    :credit => 'REFUND',
    :authorization => 'DEFERRED',
    :capture => 'RELEASE',
    :repeat => 'REPEAT',
    :void => 'VOID'
  }
  
  AVS_CVV_CODE = {
    "NOTPROVIDED" => nil, 
    "NOTCHECKED" => 'X',
    "MATCHED" => 'Y',
    "NOTMATCHED" => 'N'
  }
    
  def initialize(mode, login)
    @url = case mode
      when :test      : TEST_URL
      when :live      : LIVE_URL
      when :simulator : SIMULATOR_URL
    end
    @login = login
    @post = Peeves::PostData.new
  end
  
  def payment(money, options)
    
  end
  
  def repeat(money, options)
    
  end
  
private
  def requires!(hash, *params)
    params.each do |param| 
      if param.is_a?(Array)
        raise ArgumentError.new("Missing required parameter: #{param.first}") unless hash.has_key?(param.first) 

        valid_options = param[1..-1]
        raise ArgumentError.new("Parameter: #{param.first} must be one of #{valid_options.to_sentence(:connector => 'or')}") unless valid_options.include?(hash[param.first])
      else
        raise ArgumentError.new("Missing required parameter: #{param}") unless hash.has_key?(param) 
      end
    end
  end    
end