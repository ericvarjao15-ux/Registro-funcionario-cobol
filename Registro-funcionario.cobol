IDENTIFICATION DIVISION.
       PROGRAM-ID. ContagemFuncionarios.
       AUTHOR. ERIC VARJAO.

       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT FUNCIONARIOS ASSIGN TO "FUNCIONARIOS.TXT"
           ORGANIZATION IS LINE SEQUENTIAL.

       DATA DIVISION.
       FILE SECTION.
       FD FUNCIONARIOS.
       01 DETALHEFUNCIONARIO.
          05 MATRICULA-FUNCIONARIO PIC 9(5).
          05 NOME-FUNCIONARIO.
             10 PRIMEIRO-NOME      PIC X(20).
             10 ULTIMO-NOME        PIC X(20).
          05 GENERO                PIC X(1).

       WORKING-STORAGE SECTION.
       01 CONTADORES.
          05 TOTAL-HOMENS          PIC 9(3) VALUE 0.
          05 TOTAL-MULHERES        PIC 9(3) VALUE 0.

       01 LEITURA-FINALIZADA       PIC X VALUE "N".

       PROCEDURE DIVISION.
       PRINCIPAL.
           PERFORM GRAVAR-DADOS.
           
           DISPLAY "==================================".
           DISPLAY "Contagem de funcionarios".
           DISPLAY "==================================".

           OPEN INPUT FUNCIONARIOS.

           PERFORM UNTIL LEITURA-FINALIZADA = "S"
               READ FUNCIONARIOS INTO DETALHEFUNCIONARIO
                   AT END
                       MOVE "S" TO LEITURA-FINALIZADA
                   NOT AT END
                       DISPLAY MATRICULA-FUNCIONARIO " " GENERO " " 
                               FUNCTION TRIM(PRIMEIRO-NOME) " " 
                               FUNCTION TRIM(ULTIMO-NOME)
                       
                       IF GENERO = "M"
                           ADD 1 TO TOTAL-HOMENS
                       ELSE
                           IF GENERO = "F"
                               ADD 1 TO TOTAL-MULHERES
                           END-IF
                       END-IF
               END-READ
           END-PERFORM.

           CLOSE FUNCIONARIOS.

           DISPLAY "==================================".
           DISPLAY "Resumo:".
           DISPLAY "Total de Homens: " TOTAL-HOMENS.
           DISPLAY "Total de Mulheres: " TOTAL-MULHERES.

           STOP RUN.

       GRAVAR-DADOS.
           OPEN OUTPUT FUNCIONARIOS.

           MOVE 12321 TO MATRICULA-FUNCIONARIO.
           MOVE "Joao" TO PRIMEIRO-NOME.
           MOVE "Silva" TO ULTIMO-NOME.
           MOVE "M" TO GENERO.
           WRITE DETALHEFUNCIONARIO.

           MOVE 13434 TO MATRICULA-FUNCIONARIO.
           MOVE "Maria" TO PRIMEIRO-NOME.
           MOVE "Silva" TO ULTIMO-NOME.
           MOVE "F" TO GENERO.
           WRITE DETALHEFUNCIONARIO.

           MOVE 43543 TO MATRICULA-FUNCIONARIO.
           MOVE "Luiza" TO PRIMEIRO-NOME.
           MOVE "Albuquerque" TO ULTIMO-NOME.
           MOVE "F" TO GENERO.
           WRITE DETALHEFUNCIONARIO.

           MOVE 53453 TO MATRICULA-FUNCIONARIO.
           MOVE "Mario" TO PRIMEIRO-NOME.
           MOVE "Oliveira" TO ULTIMO-NOME.
           MOVE "M" TO GENERO.
           WRITE DETALHEFUNCIONARIO.

           CLOSE FUNCIONARIOS.
