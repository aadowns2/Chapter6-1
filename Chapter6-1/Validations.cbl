      $set ilusing "System.Windows.Forms"
       
       Identification Division.
           Program-ID. Validations.
       Data Division.
           Linkage Section.
           01  LK_File_Status                         PIC 9(2).
       Procedure Division USING LK_File_Status.
           EVALUATE LK_File_Status
                   WHEN NOT EQUAL TO 00
                       INVOKE TYPE MessageBox::Show("File Not Found")
                       STOP RUN
           END-EVALUATE.
       EXIT.