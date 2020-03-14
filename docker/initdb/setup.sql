-- for local development
CREATE USER todo IDENTIFIED BY 'todo';
grant all on `%`.* to 'todo'@'%' identified by 'todo';