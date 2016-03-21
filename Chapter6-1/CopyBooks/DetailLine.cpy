      * DetailLine
       01  CustomerDetail.
           05  Initials.
               10  Initial1                        PIC X(1).
               10                                  PIC X(1)    value ','.
               10  Initial2                        PIC X(1).
           05                                      PIC X(3)    value spaces.
           05  Last_Name                           PIC X(10).
           05                                      PIC X(5)    value spaces.
           05  Month_Trans                         PIC X(2).
           05                                      PIC X(1)    value '/'.
           05  Year_Trans                          PIC X(4).
           05                                      PIC X(5)    value spaces.
           05  Amount_Trans                        PIC $Z,Z(3).9(2).
