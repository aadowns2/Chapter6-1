      * HeaderMain
       01  HeaderMain.
           05                      PIC X(21)               value spaces.
           05                      PIC X(29)               value 'Agile Company Customer Report'.
       01  HeaderMain2.
           05                      PIC X(17)               value spaces.
           05                      PIC X(41)               value 'Prepared for the Company By Anthony Downs'.
       01  HeaderMain3.
           05                      PIC X(6)                value 'Date: '.
           05  HeaderDate          PIC 9(2)/9(2)/9(4).
           05                      PIC X(45)               value spaces.
           05                      PIC X(6)                value 'Time: '.
           05  HeaderTime          PIC X(2)BX(2)BX(2)BX(2).
               