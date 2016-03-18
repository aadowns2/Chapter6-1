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
                       
                   Select CustomerReport assign to Printer
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
                   
           FD  CustomerReport
               Record Contains 100 Characters.
               01  Print_Buffer                            PIC X(100).
           
           Working-Storage Section.
               COPY "WS_Date.cpy" REPLACING LEADING ==Prefix== BY ==WS==.
               COPY "Misc.cpy".
           
           Local-Storage Section.
           
           Linkage Section.
           
           Report Section.
           
       Procedure Division.
       
           Stop "Press <CR> to End Program"
           Stop Run.
           
       End Program.