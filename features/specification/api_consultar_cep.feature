#language: pt

Funcionalidade: Consulta de endereço por cep através de API Rest
Como um usuário que necessita de endereço
Quero consultar CEP através de serviço de API Rest
Para obter o código do IBGE referente ao CEP consultado

Contexto:
Dado o serviço viacep de consulta de CEPs

@cep_valido
Cenário: Consulta de endereço via CEP
Quando enviar a requisição informando CEP "01001000"
Então deve ser retornado o status code 200
E o response com ibge esperado deve ser "3550308"

@cep_invalido
Cenário: Consulta de endereço via CEP Invalido
Quando enviar a requisição informando CEP "01001041"
Então deve ser retornado o status code 200
E o response deve retornar elemento ERRO igual a true
