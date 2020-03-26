## Typical user + permissions creation commands:

  1. create user with password for grants:
  
`grant all on _db_.* to _user_@localhost identified by '_password_';`

  2. extra grants I always forget:
  
`grant file, show view, create view on *.* to _user_@localhost;`
