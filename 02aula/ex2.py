"""
    Exercício referente à aula 2 da disciplina 
    Sistemas de Bancos de Dados 1.

    Aluno: Rafael Makaha Gomes Ferreira
    Matrícula: 160142369
"""

# Imports area
import os
import json
import pickle

# Classes area
class Proprietario(object):
    def __init__(self):
        self.nome = ""
        self.cpf = ""
        self.carros = []


# Functions area
def menu():
    limpa_tela()
    print("##############")
    print("1. Novo Proprietário")
    print("2. Exibir Proprietários")
    print("0. Sair")
    print("##############")
    
def inserir_cpf(prop):
    cpf = int(input("Insira o CPF do proprietário: "))
    valido = False
    if len(prop) == 0:
        valido = True
    while valido == False:
        for item in prop:
            if item.cpf == cpf:
                valido = False
            else:
                valido = True
        cpf = int(input("CPF já cadastrado, favor inserir o CPF correto: "))
    
    return cpf

def inserir_carros():
    carros = []
    qnt = int(input("Inisra a quantidade de carros do proprietário: "))
    while qnt < 1:
        qnt = int(input("Inisra um valor maior do que zero: "))
    for i in range(qnt):
        carros.append(str(input("Insira o nome do carro: ")))

    return carros

def inserir(prop):
    limpa_tela()

    nome = ""
    cpf = 0
    carros = []

    nome = str(input("Insira o nome do proprietário: "))
    cpf = inserir_cpf(prop)
    carros = inserir_carros()

    novo = Proprietario()
    novo.nome = nome
    novo.cpf = cpf
    novo.qnt = len(carros)
    novo.carros = carros

    prop.append(novo)
    novo = json.dumps(novo.__dict__)

    with open("data.json", "a") as f:
        json.dump(novo, f, indent=4)
        f.write("\n")

def exibir(prop):
    limpa_tela()


def verifica_arquivo(prop):
    print(prop)
    if os.path.isfile('./data.json'):
        with open("data.json","r") as f:
            data = json.loads(f.read())
            for proprietario in data:
                print(proprietario["nome"])
                novo = Proprietario()
                # novo.nome = data.nome
                # print(data)

    else:
        prop["proprietarios"] = []
        with open("data.json", "w") as f:
            json.dump(prop,f)

def limpa_tela():
    os.system('cls' if os.name == 'nt' else 'clear')

def main():
    prop = []
    # prop = {}
    # prop["proprietarios"] = []

    # prop["proprietarios"].append({
    #     'nome': 'teste'
    # })
    opcao = 1
    verifica_arquivo(prop)

    while(opcao > 0):
        menu()
        if opcao > 2 or opcao < 0:
            opcao = int(input("Insira um opção válida: "))
        else:
            opcao = int(input("Opção: "))
        if opcao == 1:
            inserir(prop)
        if opcao == 2:
            exibir(prop)


# Execution area
main()