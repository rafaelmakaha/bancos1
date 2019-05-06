# Modelo Entidade-Relacionamento

## Entidades

- AGENCIA (<u>idAgencia</u>)
- CLIENTE (<u>idCliente</u>, nome, cpf, dataNascimento, idAgencia, idConta)
- CONTA (<u>idConta</u>, idCliente)
    - CORRENTE (idConta, maxChequeEspecial, saldo)
    - POUPANCA (idConta, dataAniversario, juroMensal, saldo)
    - INVESTIMENTO (idConta, rendimentoDiario, saldo)

## Relacionamentos

- AGENCIA - possui - CLIENTE

    Uma AGENCIA pode possuir vários CLIENTEs e um CLIENTE pode possuid apenas uma AGENCIA.
    
    **Cardinalidade**: 1:n

- CLIENTE - possui - CONTA

    Um CLIENTE possui uma CONTA e uma CONTA pertence a um CLIENTE.
    
    **Cardinalidade**: 1:1

## Diagrama Entidade-Relacionamento

![DER](DER.JPG)

## Diagrama de Esquemas

![Diagrama](DiagramaER.PNG)