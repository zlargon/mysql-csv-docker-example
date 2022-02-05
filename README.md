# Import CSV files to MySQL by Docker

## Prerequisite

- Docker Desktop (or other container runtime)
- Docker and docker-compose client commands
- MySQL client command
- Yarn (optional)

## 1. Run docker MySQL container in background

```bash
yarn up

# or
docker compose -f docker-compose.yml up -d
```

## 2. Wait for the MySQL container ready. It takes about 30 - 60 seconds

You can check by MySQL container's logs

```bash
yarn log

# or
docker compose -f docker-compose.yml logs --follow
```

When the MySQL container is ready, you will see the message: **ready for connections**

```
[System] [MY-010931] [Server] /usr/sbin/mysqld: ready for connections. Version: '8.0.28'  socket: '/var/run/mysqld/mysqld.sock'  port: 3306  MySQL Community Server - GPL.
```

You can stop the docker logs by pressing `Ctrl + C`

## 3. Run testing query

```bash
yarn test

# or
mysql -h 127.0.0.1 -u root -D crime -e 'SELECT INCIDENT_NUMBER, OFFENSE_CODE_GROUP, OFFENSE_DESCRIPTION FROM CRIME_CSV LIMIT 10'
```

Except to see the output like this:

```
+-----------------+---------------------------------+---------------------------------------+
| INCIDENT_NUMBER | OFFENSE_CODE_GROUP              | OFFENSE_DESCRIPTION                   |
+-----------------+---------------------------------+---------------------------------------+
| I182026842      | Investigate Person              | INVESTIGATE PERSON                    |
| I182026839      | Auto Theft                      | AUTO THEFT                            |
| I182026838      | Towed                           | TOWED MOTOR VEHICLE                   |
| I182026834      | Aggravated Assault              | ASSAULT - AGGRAVATED - BATTERY        |
| I182026830      | Larceny From Motor Vehicle      | LARCENY THEFT FROM MV - NON-ACCESSORY |
| I182026829      | Larceny                         | LARCENY SHOPLIFTING                   |
| I182026828      | Larceny                         | LARCENY SHOPLIFTING                   |
| I182026825      | Investigate Property            | INVESTIGATE PROPERTY                  |
| I182026824      | Violations                      | VAL - OPERATING WITHOUT LICENSE       |
| I182026824      | Motor Vehicle Accident Response | M/V ACCIDENT - PROPERTY DAMAGE        |
+-----------------+---------------------------------+---------------------------------------+
```
