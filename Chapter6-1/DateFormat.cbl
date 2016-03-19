       Identification Division.
           Program-ID. DateFormat as "Chapter6_1.DateFormat".

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01  WS_Date.
           02 WS_Day                     PIC XX.
           02 WS_Month                   PIC XX.
           02 WS_Year                    PIC XXXX.

       LINKAGE SECTION.
       01  LKDate.
       02  LKYear                    PIC XXXX.
       02  LKMonth                   PIC XX.
       02  LKDay                     PIC XX.

       01  DDMMYYYYDate                   PIC X(8).

       PROCEDURE DIVISION USING LKDate.
       
           MOVE LKDay      TO WS_Day.
           MOVE LKMonth    TO WS_Month.
           MOVE LKYear     TO WS_Year.
           MOVE WS_Date TO LKDate.
       
       EXIT PROGRAM.

       END PROGRAM DateFormat.