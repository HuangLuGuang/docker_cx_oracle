FROM python:3.7.7-slim-buster


ENV ORACLE_HOME /opt/oracle/instantclient_12_1
ENV LD_RUN_PATH=$ORACLE_HOME

COPY instantclient/* /tmp/

RUN \
    apt-get update && apt-get install -y unzip python3-pip  libaio1 && rm -rf /var/lib/apt/lists/* && \
	mkdir -p /opt/oracle && \
	unzip "/tmp/instantclient*.zip" -d /opt/oracle && \
	ln -s $ORACLE_HOME/libclntsh.so.12.1 $ORACLE_HOME/libclntsh.so && \
	rm -rf /var/lib/apt/lists/*  && \
	pip install --no-cache-dir cx_Oracle
	

