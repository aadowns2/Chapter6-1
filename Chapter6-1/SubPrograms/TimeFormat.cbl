       Identification Division.
           Program-ID. TimeFormats.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01  WS_Time.
           05  WS_Hours                    PIC 9(2).
           05  WS_Minutes                  PIC 9(2).
           05  WS_Second                   PIC 9(2).
           05  WS_Millisecond              PIC 9(2).

       LINKAGE SECTION.
           Copy "CopyBooks\WS_Date.cpy" REPLACING LEADING ==Prefix== BY ==LK==.
      
       Procedure DIVISION USING LK_Current_Time.
           
           IF LK_Current_Hours = 00 
               MOVE 12 TO LK_Current_Hours
                   Else
                       MOVE LK_Current_Hours TO WS_Hours
           MOVE LK_Current_Minute TO WS_Minutes
           MOVE LK_Current_Second TO WS_Second
           MOVE LK_Current_Millisecond TO WS_Millisecond
           MOVE WS_Time TO LK_Current_Time
       
       EXIT PROGRAM.