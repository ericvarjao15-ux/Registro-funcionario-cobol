# Contagem e Registro de Funcionários (COBOL)

Este é um programa desenvolvido em COBOL que simula o cadastro de funcionários em um arquivo de texto sequencial (`FUNCIONARIOS.TXT`), realiza a leitura registro a registro e calcula o totalizador de funcionários por gênero (masculino e feminino).

## 🚀 Funcionalidades

- **Gravação de Dados:** Escreve registros iniciais de funcionários com matrícula, nome, sobrenome e gênero no arquivo sequencial.
- **Leitura Sequencial:** Lê os registros gravados tratando a condição de fim de arquivo (`AT END`).
- **Formatação:** Utiliza funções intrínsecas (`FUNCTION TRIM`) para remoção de espaços em branco na exibição dos nomes.
- **Totalização:** Contabiliza o total de homens (`TOTAL-HOMENS`) e mulheres (`TOTAL-MULHERES`).

## 🛠️ Tecnologias Utilizadas

- **Linguagem:** COBOL (GnuCOBOL / IBM COBOL)
- **Organização de Arquivo:** Line Sequential

## 📄 Estrutura do Registro

```cobol
01 DETALHEFUNCIONARIO.
   05 MATRICULA-FUNCIONARIO PIC 9(5).
   05 NOME-FUNCIONARIO.
      10 PRIMEIRO-NOME      PIC X(20).
      10 ULTIMO-NOME        PIC X(20).
   05 GENERO                PIC X(1).
```

## ⚙️ Como Executar

Caso esteja utilizando o **GnuCOBOL** (`cobc`), execute os comandos abaixo no terminal:

```bash
# Compilar o programa
cobc -x -o ContagemFuncionarios ContagemFuncionarios.cbl

# Executar o binário gerado
./ContagemFuncionarios
```

## 📊 Exemplo de Saída

```text
==================================
Contagem de funcionarios
==================================
12321 M Joao Silva
13434 F Maria Silva
43543 F Luiza Albuquerque
53453 M Mario Oliveira
==================================
Resumo:
Total de Homens: 002
Total de Mulheres: 002
```
