# MySQL Tuner

Docker container for [MySQLTuner](https://github.com/major/MySQLTuner-perl).

## Usage

    docker run -it --rm exoplatform/mysqltuner --host <hostname> \
        --user <username> \
        --pass <password> \
        --forcemem <size>

info: the `--forcemem` option must always be specified as this docker container is always connected to a remote MySQL server
