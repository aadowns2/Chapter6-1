       Identification Division.
           Program-ID. Chapter6-1.
               Author. Anthony Downs
               Installation.
               Date-Written. March 18, 2016.
               Date-Compiled.
               Security.
               
       Environment Division.
           Configuration Section.
               Special-Names.
               
           Input-Output Section.
               File-Control.
                   Select CustomerFile assign to CustomerData
                       File Status is File_Status
                       Organization is Sequential.
                       
                   Select CustomerReportFile assign to CustomerReport
                       File Status is File_Status
                       Organization is Sequential.
               
               I-O-Control.
               
       Data Division.
           File Section.
           FD  CustomerFile
               Record Contains 24 Characters.
               01  CustomerRecord.
                   05  Initials.
                       10  Initial1                        PIC X(1).
                       10  Initial2                        PIC X(1).
                   05  Last_Name                           PIC X(10).
                   05  Month_Trans                         PIC X(2).
                   05  Year_Trans                          PIC X(5).
                   05  Amount_Trans                        PIC 9(4)V9(2).
                   
           FD  CustomerReportFile
               Record Contains 100 Characters.
               01  CustomerReport.
                   05  Print_Buffer                            PIC X(100).
           
           Working-Storage Section.
               COPY "WS_Date.cpy" REPLACING LEADING ==Prefix== BY ==WS==.
               COPY "Misc.cpy".
               COPY "HeaderMain.cpy".
               COPY "HeaderColumns.cpy".
               COPY "DetailLine.cpy".
           
       Procedure Division.
       
           Initilization.
               OPEN INPUT CustomerFile
                   CALL "Validations" USING by CONTENT File_Status.
               OPEN OUTPUT CustomerReportFile
                   CALL "Validations" USING by CONTENT File_Status.
                   
                   MOVE FUNCTION CURRENT-DATE TO WS_Current_Date.
                   MOVE WS_Current_Month to Header_Month.
                   MOVE WS_Current_Day to Header_Day.
                   MOVE WS_Current_Year TO Header_Year.
                   
                   WRITE CustomerReport FROM HeaderMain.
                   WRITE CustomerReport FROM HeaderMain2 AFTER ADVANCING 1 LINES.
                   WRITE CustomerReport FROM HeaderDate AFTER ADVANCING 1 LINES.
           
           Stop "Press <CR> to End Program"
           Stop Run.
           
       End Program.