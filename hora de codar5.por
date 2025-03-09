//Ao acessar o sistema, pergunte o nome do usuário e diga "Olá {Nome} é um prazer ter você por aqui!"

//Na função "inicio", utilize escolha/caso (switch/case) para validar a opção escolhida pelo usuário.

//Sempre que o usuário for sacar dinheiro, o valor restante não pode ser negativo, ou seja, caso o usuário tente sacar mais do que tem em saldo, a ação não deve ocorrer. Exiba uma mensagem de "Operação não autorizada".

//Sempre que o usuário for sacar dinheiro, o valor a ser sacado não pode ser igual ou menor que zero. Exiba uma mensagem de "Operação não autorizada".

//Adicionar a opção para ver o extrato (Coloque algumas compras ou depósitos fictícios).

//Adicionar a opção para fazer uma transferência. A transferência consiste em você informar o número de uma conta (pode ser qualquer número, mas obrigatoriamente um número, ou seja, nenhum outro caractere deve ser aceito), perguntar o valor da transferência e remover o valor da conta da mesma forma como na ação do saldo. Caso o usuário tente transferir mais do que tem em saldo, a ação não deve ocorrer. Exiba uma mensagem de "Operação não autorizada".

//Sempre que o usuário for transferir dinheiro,  o valor a ser transferido não pode ser igual ou menor que zero, ou seja, caso o usuário tente transferir mais do que tem em saldo, a ação não deve ocorrer. Exiba uma mensagem de "Operação não autorizada".

//No menu principal, a ordem das opções deve ser: Saldo, Extrato, Saque, Depósito, Transferência e Sair.

//Atualize a função "erro" com as novas opções do menu.

//Caso o usuário informe um valor para depósito igual ou menor que zero, não deixe a operação ocorrer. Exiba uma mensagem de "Operação não autorizada".

//Sempre que o usuário for acessar o saldo, sacar, retirar o extrato ou transferir dinheiro é necessário que ele informe uma senha. Essa senha deve ser validada com uma condicional. A senha é 3589.

//Caso a senha informada não seja a correta, é necessário chamar a função atual novamente. 

//Quando o usuário escolher sair do sistema, exiba uma mensagem agradecendo por utilizar os serviços do banco: "{Nome}, foi um prazer ter você por aqui!".

programa
{
    real saldo = 150.00 // Saldo inicial
    cadeia nomeUsuario // Variável para armazenar o nome do usuário
    inteiro SENHA_CORRETA = 3589 // 

    funcao inicio() {
        escreva("Bem-vindo ao sistema do caixa eletrônico!\n")
        escreva("Por favor, informe seu nome: ")
        leia(nomeUsuario)
        escreva("Olá ", nomeUsuario, ", é um prazer ter você por aqui!\n")

        menuPrincipal()
    }

    funcao menuPrincipal() {
        inteiro opcao

        escreva("\nEscolha uma opção:\n")
        escreva("1. Ver saldo\n")
        escreva("2. Ver extrato\n")
        escreva("3. Fazer saque\n")
        escreva("4. Fazer depósito\n")
        escreva("5. Fazer transferência\n")
        escreva("6. Sair\n")
        leia(opcao)

        escolha (opcao) {
            caso 1:
                verSaldo()
                pare
            caso 2:
                verExtrato()
                pare
            caso 3:
                fazerSaque()
                pare
            caso 4:
                fazerDeposito()
                pare
            caso 5:
                fazerTransferencia()
                pare
            caso 6:
                sair()
                pare
            caso contrario:
                erro()
        }
    }

    funcao verSaldo() {
        se (validarSenha()) {
            escreva("Seu saldo atual é: R$", saldo, "\n")
        }
        menuPrincipal()
    }

    funcao verExtrato() {
        se (validarSenha()) {
            escreva("----- EXTRATO -----\n")
            escreva("1. Depósito: R$150.00 (Saldo inicial)\n")
            escreva("2. Compra: R$-50.00 (Supermercado)\n")
            escreva("3. Depósito: R$100.00\n")
            escreva("4. Saque: R$-30.00\n")
            escreva("-------------------\n")
        }
        menuPrincipal()
    }

    funcao fazerSaque() {
        se (validarSenha()) {
            real saque
            escreva("Qual o valor para saque? ")
            leia(saque)

            se (saque <= 0) {
                escreva("Operação não autorizada. Valor inválido.\n")
            } senao se (saque > saldo) {
                escreva("Operação não autorizada. Saldo insuficiente.\n")
            } senao {
                saldo = saldo - saque
                escreva("Saque de R$", saque, " realizado com sucesso.\n")
                verSaldo()
            }
        }
        menuPrincipal()
    }

    funcao fazerDeposito() {
        real deposito
        escreva("Qual o valor para depósito? ")
        leia(deposito)

        se (deposito <= 0) {
            escreva("Operação não autorizada. Valor inválido.\n")
        } senao {
            saldo = saldo + deposito
            escreva("Depósito de R$", deposito, " realizado com sucesso.\n")
            verSaldo()
        }
        menuPrincipal()
    }

    funcao fazerTransferencia() {
        se (validarSenha()) {
            real valorTransferencia
            inteiro numeroConta

            escreva("Informe o número da conta para transferência: ")
            leia(numeroConta)

            // Validação do número da conta (deve ser um número)
            se (numeroConta <= 0) {
                escreva("Operação não autorizada. Número de conta inválido.\n")
                menuPrincipal()
                retorne
            }

            escreva("Qual o valor para transferência? ")
            leia(valorTransferencia)

            se (valorTransferencia <= 0) {
                escreva("Operação não autorizada. Valor inválido.\n")
            } senao se (valorTransferencia > saldo) {
                escreva("Operação não autorizada. Saldo insuficiente.\n")
            } senao {
                saldo = saldo - valorTransferencia
                escreva("Transferência de R$", valorTransferencia, " para a conta ", numeroConta, " realizada com sucesso.\n")
                verSaldo()
            }
        }
        menuPrincipal()
    }

    funcao erro() {
        escreva("Opção inválida. Tente novamente.\n")
        menuPrincipal()
    }

    funcao sair() {
        escreva(nomeUsuario, ", foi um prazer ter você por aqui! Até logo.\n")
    }

    funcao logico validarSenha() {
        inteiro senha
        escreva("Por favor, informe sua senha: ")
        leia(senha)

        se (senha == SENHA_CORRETA) {
            retorne verdadeiro
        } senao {
            escreva("Senha incorreta. Tente novamente.\n")
            retorne falso
        }
    }
}