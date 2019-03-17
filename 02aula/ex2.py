"""
    Exercício referente à aula 2 da disciplina 
    Sistemas de Bancos de Dados 1.

    Aluno: Rafael Makaha Gomes Ferreira
    Matrícula: 160142369
"""

# Imports area
import os
import pickle

# Classes area
class Proprietario:
    nome = ""
    cpf = ""


# Functions area
def menu():
    limpa_tela()
    print("##############")
    print("1. Novo Proprietário")
    print("2. Exibir Proprietários")
    print("0. Sair")
    print("##############")
    
def inserir(list prop):
    limpa_tela()
    print ("oi")

def exibir(list prop):
    limpa_tela()
    print ("oi2")

def verifica_arquivo():
    if os.path.isfile('./arquivo.txt'):
        print("há arquivo")
    else:
        print("não há arquivo")

def limpa_tela():
    os.system('cls' if os.name == 'nt' else 'clear')

def main():
    prop = []
    opcao = 1
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



main()