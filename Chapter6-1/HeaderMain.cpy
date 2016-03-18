      * HeaderMain
       01  HeaderMain.
           05                  PIC X(21)   value spaces.
           05                  PIC X(29)   value 'Agile Company Customer Report'.
       01  HeaderMain2.
           05                  PIC X(17)   value spaces.
           05                  PIC X(41)   value 'Prepared for the Company By Anthony Downs'.
       01  HeaderDate.
           05                  PIC X(25)   value spaces.
           05  Header_Month    PIC X(2).
           05                  PIC X(1)    value '/'.
           05  Header_Day      PIC X(2).
           05                  PIC X(1)    value '/'.
           05  Header_Year     PIC X(4).