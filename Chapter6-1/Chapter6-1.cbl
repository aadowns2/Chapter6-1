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
                   Select CustMast assign to CustomerData
                       File Status is File_Status
                       Organization is Sequential.
                       
                   Select CustRpt assign to CustomerReport
                       File Status is File_Status
                       Organization is Sequential.
               
               I-O-Control.
               
       Data Division.
           File Section.
           FD  CustMast
               Record Contains 24 Characters.
               01  CustomerRecord.
                   05  Initials.
                       10  Initial1                        PIC X(1).
                       10  Initial2                        PIC X(1).
                   05  Last_Name                           PIC X(10).
                   05  Month_Trans                         PIC X(2).
                   05  Year_Trans                          PIC X(5).
                   05  Amount_Trans                        PIC 9(4)V9(2).
                   
           FD  CustRpt
               Record Contains 100 Characters.
               01  Print_Buffer                            PIC X(100).
           
           Working-Storage Section.
               COPY "WS_Date.cpy" REPLACING LEADING ==Prefix== BY ==WS==.
               COPY "Misc.cpy".
               COPY "HeaderMain.cpy".
               COPY "HeaderColumns.cpy".
               COPY "DetailLine.cpy".
           
       Procedure Division.
       
           Initilization.
               OPEN INPUT CustMast
                   CALL "Validations" USING by CONTENT File_Status.
               OPEN OUTPUT CustRpt
                   CALL "Validations" USING by CONTENT File_Status.
                 
                MOVE FUNCTION CURRENT-DATE TO WS_Current_Date.
                
                CALL 'DateFormat' USING WS_Current_Date.
                MOVE WS_Current_Date TO WS_Date
                MOVE WS_Date TO Formatted_Date.
                INVOKE type Debug::WriteLine(Formatted_Date).
                   
      *            PERFORM 900-Date-Format
                   
                   WRITE Print_Buffer FROM HeaderMain
                   WRITE Print_Buffer FROM HeaderMain2 AFTER ADVANCING 1 LINES
                   WRITE Print_Buffer FROM HeaderDate AFTER ADVANCING 1 LINES
           
           Stop Run.
           
      *    900-Date-Format.
      *    
      *            MOVE FUNCTION CURRENT-DATE TO Current_Date.
      *            MOVE CD_Year TO WS_Year_Temp.
      *            MOVE CD_Month TO WS_Month_Temp.
      *            MOVE CD_Day TO WS_Day_Temp.
      *            MOVE WS_Date TO HeaderDate.
      *            
      *            INVOKE type Debug::WriteLine(HeaderDate).
                   
       End Program.