      *Working Storage date field.
       01  Prefix_Current_Date.
               05  Prefix_Current_Year                     PIC 9(4).
               05  Prefix_Current_Month                    PIC 9(2).
               05  Prefix_Current_Day                      PIC 9(2).
               
       01  Prefix_Current_Time.
               05  Prefix_Current_Hours                    PIC 9(2).
               05  Prefix_Current_Minute                   PIC 9(2).
               05  Prefix_Current_Second                   PIC 9(2).
               05  Prefix_Current_Millisecond              PIC 9(2).
               
       01  Prefix_Formatted_Date                           PIC 9(2)/9(2)/9(4).
       01  Prefix_Formatted_Time                           PIC 9(2)BBB(2)9(2).