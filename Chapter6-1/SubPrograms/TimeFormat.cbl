       Identification Division.
           Program-ID. TimeFormats.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01  WS_Time.
           05  WS_Hours                    PIC 9(2).
           05  WS_Minutes                  PIC 9(2).
           05  WS_Second                   PIC 9(2).
           05  WS_AM_PM                    PIC X(2).

       LINKAGE SECTION.
           Copy "CopyBooks\WS_Date.cpy" REPLACING LEADING ==Prefix== BY ==LK==.
      
       Procedure DIVISION USING LK_Current_Time.
       
           MOVE FUNCTION CURRENT-DATE(9:6) to LK_Current_Time
           EVALUATE LK_Current_Hours
               WHEN = 00
                   COMPUTE WS_Hours = LK_Current_Hours + 12
                   MOVE 'AM' TO WS_AM_PM
               WHEN > 00 AND < 12
                   MOVE LK_Current_Hours TO WS_Hours
                   MOVE 'AM' TO WS_AM_PM
               WHEN > 12
                   MOVE LK_Current_Hours TO WS_Hours
                   MOVE 'PM' TO WS_AM_PM
           END-EVALUATE
                   
           MOVE LK_Current_Minute TO WS_Minutes
           MOVE LK_Current_Second TO WS_Second
           MOVE WS_Time TO LK_Current_Time
       
       EXIT PROGRAM.