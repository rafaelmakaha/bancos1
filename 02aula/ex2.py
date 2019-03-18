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
        self.cpf = ""
        self.nome = ""
        self.qnt = ""
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
    if len(prop["proprietarios"]) == 0:
        valido = True
    while valido == False:
        for item in prop["proprietarios"]:
            if item["cpf"] == cpf:
                valido = False
                cpf = int(input("CPF já cadastrado, favor inserir o CPF correto: "))
                break
            else:
                valido = True
    
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

    nome = "teste"
    cpf = 123
    carros = ['gol']

    nome = str(input("Insira o nome do proprietário: "))
    cpf = inserir_cpf(prop)
    carros = inserir_carros()

    novo = Proprietario()
    novo.nome = nome
    novo.cpf = cpf
    novo.qnt = len(carros)
    novo.carros = carros

    # transforma o objeto em dict
    novo = vars(novo) 

    prop["proprietarios"].append(novo)

    prop["proprietarios"] = sorted(prop["proprietarios"], key=lambda x: x["cpf"])

    with open("data.json", "w") as f:
        json.dump(prop, f, indent=4)
        f.write("\n")

def exibir(prop):
    limpa_tela()
    print(prop)
    input()


def verifica_arquivo(prop):
    if os.path.isfile('./data.json'):
        with open("data.json","r") as f:
            prop = json.load(f)

    else:
        with open("data.json", "w") as f:
            json.dump(prop,f)

    return prop

def limpa_tela():
    os.system('cls' if os.name == 'nt' else 'clear')

def main():
    prop = {}
    prop["proprietarios"] = []

    opcao = 1
    prop = verifica_arquivo(prop)

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