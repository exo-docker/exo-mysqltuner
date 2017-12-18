# Docker image for MySQL Tuner script
#
# Build:    docker build -t exoplatform/mysqltuner .
#
# Run:      docker run -ti --rm exoplatform/mysqltuner
#

FROM alpine:3.7

ENV TERM=xterm \
    # Local
    LANG=en_US.UTF-8 \
    LANGUAGE=en_US:en \
    LC_ALL=en_US.UTF-8

# Installing dependencies
RUN apk --no-cache add \
    perl \
    perl-doc \
    mysql-client \
    && rm -rf /var/cache/apk/*

# Installing MySQL Tuner
RUN set -eux \
    && echo "Downloading MySQL Tuner script ..." \
    && wget http://mysqltuner.pl/ -O /mysqltuner.pl \
    && wget https://raw.githubusercontent.com/major/MySQLTuner-perl/master/basic_passwords.txt -O /basic_passwords.txt \
    && wget https://raw.githubusercontent.com/major/MySQLTuner-perl/master/vulnerabilities.csv -O /vulnerabilities.csv

ENTRYPOINT ["perl", "/mysqltuner.pl"]
CMD ["--help"]
