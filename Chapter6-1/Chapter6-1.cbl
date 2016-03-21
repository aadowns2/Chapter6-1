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
                       Organization is Line Sequential.
                       
                   Select CustRpt assign to CustomerReport
                       File Status is File_Status
                       Organization is Line Sequential.
               
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
                   05  Year_Trans                          PIC X(4).
                   05  Amount_Trans                        PIC 9(4)V9(2).
                   
           FD  CustRpt
               Record Contains 132 Characters.
               01  Print_Buffer                            PIC X(132).
           
           Working-Storage Section.
               COPY "CopyBooks/WS_Date.cpy" REPLACING LEADING ==Prefix== BY ==WS==.
               COPY "CopyBooks/Misc.cpy".
               COPY "CopyBooks/HeaderMain.cpy".
               COPY "CopyBooks\HeaderColumns.cpy".
               COPY "CopyBooks\DetailLine.cpy".
               COPY "CopyBooks\Footer.cpy".
              
           
       Procedure Division.
       
           Initilization.
           
               INITIALIZE Sub_Total_Purchases, Total_Purchases
			   OPEN INPUT CustMast
                   CALL "Validations" USING File_Status
               OPEN OUTPUT CustRpt
                   CALL "Validations" USING File_Status
               
               PERFORM 100-Write-Headings
               PERFORM 200-Read-Records until No_More_Records
               PERFORM 350-Write-Footers
               PERFORM 400-Close-Program
               STOP RUN.
               
           100-Write-Headings.
               INITIALIZE Print_Buffer
               PERFORM 500-FormatDate
               PERFORM 600-FormatTime
               WRITE Print_Buffer FROM HeaderMain
               WRITE Print_Buffer FROM HeaderMain2
               WRITE Print_Buffer FROM HeaderMain3
               WRITE Print_Buffer FROM HeaderColumns AFTER ADVANCING 1 LINE.
               
           200-Read-Records.
               READ CustMast
                   AT END SET No_More_Records TO TRUE
                       NOT AT END
                           PERFORM 250-Calculations
                           PERFORM 300-Write-Records.
           
           250-Calculations.
      *        ADD Amount_Trans OF CustomerRecord TO Sub_Total_Purchases
      *        MOVE Sub_Total_Purchases TO Total_Purchases.
               COMPUTE Sub_Total_Purchases = Sub_Total_Purchases + Amount_Trans OF CustomerRecord
               MOVE Sub_Total_Purchases TO Total_Purchases.
           
           300-Write-Records.
               MOVE CORRESPONDING CustomerRecord TO CustomerDetail
               WRITE Print_Buffer FROM CustomerDetail AFTER ADVANCING 1 LINES.
               
           350-Write-Footers.
               WRITE Print_Buffer FROM FooterDetail AFTER ADVANCING 2 LINES.
             
           400-Close-Program.
               CLOSE CustMast
               CLOSE CustRpt.
               
           500-FormatDate.
               CALL 'DateFormat' USING WS_Current_Date
               UNSTRING WS_Current_Date INTO HeaderDate.
               
           600-FormatTime.
               CALL 'TimeFormat' USING WS_Current_Time
               UNSTRING WS_Current_Time INTO HeaderTime
               INSPECT HeaderTime (1:8) Replacing all spaces by ":".
               
       End Program.