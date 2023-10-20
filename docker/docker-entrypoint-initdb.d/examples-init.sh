# ------------------------------------------------------------------------
# Creates the examples database and respective user. This database location
# and access credentials are defined on the environment variables
# ------------------------------------------------------------------------
set -e

mysql -u "root" -p"${MYSQL_ROOT_PASSWORD}" <<-EOSQL
  CREATE DATABASE ${EXAMPLES_DB};
  CREATE USER '${EXAMPLES_USER}'@'%' IDENTIFIED BY '${EXAMPLES_PASSWORD}';
  GRANT ALL PRIVILEGES ON ${EXAMPLES_DB}.* TO '${EXAMPLES_USER}'@'%';
  
  FLUSH PRIVILEGES;
EOSQL

#GRANT ALL PRIVILEGES ON ${DATABASE_DB}.* TO '${DATABASE_USER}'@'%';
