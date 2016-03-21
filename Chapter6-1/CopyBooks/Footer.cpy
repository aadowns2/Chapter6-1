      * Footer
       01  FooterDetail.
           05                              PIC X(16)               value spaces.
           05                              PIC X(17)               value "Total Purchases: ".
           05  Total_Purchases             PIC $Z(2),Z(3).9(2).
           
       01  Sub_Total_Purchases             PIC 9(2)9(4)V9(2).