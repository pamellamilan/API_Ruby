Dado("o serviço viacep de consulta de CEPs") do
    @via_cep = HTTParty.get("https://viacep.com.br")
    #puts @via_cep.body
  end
  
  Quando("enviar a requisição informando CEP {string}") do |string|
    @get_cep = HTTParty.get("https://viacep.com.br/ws/" + string + "/json/")
  end
  
  Então("deve ser retornado o status code {int}") do |int|
    expect(@get_cep.code).to eq (200)
  end
  
  Então("o response com ibge esperado deve ser {string}") do |string|
    expect(@get_cep['ibge']).to eq (string)
    puts "IBGE: " + @get_cep['ibge']
  end
  
  Então("o response deve retornar elemento ERRO igual a true") do    
    expect(@get_cep['erro']).to eq (true)
  end