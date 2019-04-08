FROM centos/postgresql-10-centos7
LABEL mail="1141591465@qq.com"
LABEL author="dalong"
COPY zombodb_centos7_pg10-10-1.0.3_1.x86_64.rpm /app/zombodb_centos7_pg10-10-1.0.3_1.x86_64.rpm
COPY plgo-rpm-1.0-1.el7.x86_64.rpm /app/plgo-rpm-1.0-1.el7.x86_64.rpm
USER root
RUN rpm -Uvh /app/zombodb_centos7_pg10-10-1.0.3_1.x86_64.rpm
RUN rpm -Uvh /app/plgo-rpm-1.0-1.el7.x86_64.rpm
RUN cp -rf  /usr/pgsql-10/share/extension/* /opt/rh/rh-postgresql10/root/usr/share/pgsql/extension
RUN cp /usr/pgsql-10/lib/zombodb.so  /opt/rh/rh-postgresql10/root/lib64/pgsql/
RUN cp /usr/pgsql-10/lib/example.so  /opt/rh/rh-postgresql10/root/lib64/pgsql/
USER postgres