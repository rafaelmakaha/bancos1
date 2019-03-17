// Este arquivo contém o exercício
// para a segunda aula da disciplina 
// de Bancos 1 da Universidade de Brasília

#include<stdio.h>
#include<stdlib.h>
#include<string.h>

typedef struct proprietario{
    char nome[20];
    int rg;
    int cpf;
    int qnt;
    char **carros;
}prop;

void menu(){
    printf("###################\n");
    printf("1. Inserir pessoa\n");
    printf("2. exibir pessoas\n");
    printf("3. Sair\n");
    printf("###################\n");
}

// int novo(){
//     int valor;

//     system("clear");
//     printf("Deseja iniciar um novo projeto?\n");
//     printf("1. Sim\n");
//     printf("0. Não\n");
//     scanf("%d", &valor);
    
//     return valor;
// }

prop inserir(){
    prop pessoa;
    system("clear");
    printf("Insira nome: ");
    scanf("%s", pessoa.nome);
    printf("Insira RG: ");
    scanf("%d",&pessoa.rg);
    printf("Insira CPF: ");
    scanf("%d", &pessoa.cpf);
    printf("Insira a quantidade de carros: ");
    scanf("%d", &pessoa.qnt);

    pessoa.carros =  malloc(sizeof(char*)*pessoa.qnt);

    for(int i=0; i < pessoa.qnt; i++ ){
        printf("Insira nome do carro: ");
        pessoa.carros[i] =  malloc(sizeof(char*)*30);
        
        scanf("%s", pessoa.carros[i]);
        fflush(stdin);
    }
    return pessoa;
}

void salvar(prop pessoas[20], int total){
    FILE *f = fopen("arquivo.txt", "wb");

    fwrite(&total, sizeof(int), 1, f);

    for(int i=0; i < 20; i++){
        fwrite(&pessoas[i], 1, sizeof(prop), f);
    }
    fclose(f);
}

void exibir(prop *pessoas, int total){
    for(int i=0; i < total; i++){
        printf("----------------------------------------------------\n");
        printf("Nome: %s\n", pessoas[i].nome);
        printf("RG: %d\n", pessoas[i].rg);
        printf("CPF: %d\n", pessoas[i].cpf);
        printf("quant de carros: %d\n", pessoas[i].qnt);
        for(int j=0; j < pessoas[i].qnt; j++){
            printf("Carro %d: %s\n", j, pessoas[i].carros[j]);
        }
    }
    getchar();
}

void realocar(prop* pessoas, int total){
    prop* novo = malloc(sizeof(prop) * total);

    memcpy(novo, &pessoas, sizeof(prop));

    pessoas = novo;
}

int carregar(prop* pessoas){
    FILE* f = fopen("arquivo.txt", "rb");
    int total;

    if(f != NULL) {
        fread(&total, sizeof(int), 1, f);
        pessoas = malloc(sizeof(prop) * total);
        for(int i=0; i < total; i++){
            fread(&pessoas[i], sizeof(prop), 1, f);
        }
    }

    fclose(f);

    return total;
}

int existe_arquivo(){
    FILE* f;
    if (f = fopen("arquivo.txt","rb")){
        fclose(f);

        return 1;
    }
    return 0;
}


int main(){
    prop *pessoas;
    int total, flag=0;
    int input=1;

    if(existe_arquivo()){
        total = carregar(pessoas);
        pessoas = malloc(sizeof(prop) * total);

    }else{
        total = 1;
        pessoas = malloc(sizeof(prop) * total);
        flag = 1;
    }

    while(input != 3){
        system("clear");
        menu();
        scanf("%d",&input);
        switch(input){
            case 1:
                if(flag == 1){
                    flag = 0;
                    pessoas[total] = inserir();
                }else{
                    total++;
                    realocar(pessoas, total);
                    pessoas[total] = inserir();
                }
                printf("%s\n", pessoas[0].nome);
                getchar();
                getchar();
                break;
            case 2:
                exibir(pessoas, total);
                break;
            case 3:
                salvar(pessoas, total);
                break;
        }
    }
    return 0;

}