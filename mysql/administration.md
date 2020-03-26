Create user with password for grants:
  grant all on _db_.* to _user_@localhost identified by '_password_';

Extra grants usually required:
  grant file, show view, create view on *.* to _user_@localhost;
