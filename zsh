EXPRESSIONS

Expression     Example           Description
!!             sudo !!           Last command (sudo !!)
!*             vim !*            Last command’s parameters (vim !*)
!^                               Last command’s first parameter
!$                               Last command’s last parameter
!?ls <tab>     sudo !?mv <tab>   Command and params of last ls command
!?ls?:* <tab>                    Params of last ls command
*(m0)          rm  *(m0)         Last modified today
*(m-4)                           Last modified <4 days ago

