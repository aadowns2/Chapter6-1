      $set ilusing "System.Windows.Forms"
       
       Identification Division.
           Program-ID. Validations.
       Data Division.
       
           Working-Storage Section.
           01  ValidationCodes                         PIC X(35).
               88  File_Error                          value "Error in opening files".
               88  File_Success                        value "File open successful".
           
           Linkage Section.
           01  LK_File_Status                         PIC X(2).
           
       Procedure Division USING LK_File_Status.
           EVALUATE LK_File_Status
                   WHEN EQUAL TO 00
                       SET File_Success TO TRUE
                           DISPLAY ValidationCodes
                   WHEN GREATER THAN 00
                       SET File_Error TO TRUE
                           DISPLAY ValidationCodes
                       STOP RUN
           END-EVALUATE.
       EXIT.