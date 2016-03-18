      *Misc fields and indicators
       01  Status_Indicators.
           05  File_Status                             PIC 9(2).
       01  Switches                                    PIC X(1).
           88  No_More_Records                                     value 'N'.
       01  Misc_Variables.
           05  Page_Count                              PIC 9(2).