       Identification Division.
           Program-ID. DateFormat.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01  WS_Date.
           05 WS_Month                     PIC 9(2).
           05 WS_Day                       PIC 9(2).
           05 WS_Year                      PIC 9(4).

       LINKAGE SECTION.
           COPY "WS_Date.cpy" REPLACING LEADING ==Prefix== BY LK.
       
       PROCEDURE DIVISION USING LK_Current_Date.
       
           MOVE LK_Current_Day TO WS_Day.
           MOVE LK_Current_Month    TO WS_Month.
           MOVE LK_Current_Year     TO WS_Year.
           MOVE WS_Date TO LK_Current_Date.
     
       EXIT PROGRAM.