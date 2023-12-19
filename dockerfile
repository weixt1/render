FROM centos:centos7.1.1503
ENV TZ "Asia/Shanghai"
ENV TERM xterm
ENV MYPATH /user/local
WORKDIR $MYPATH

RUN yum -y install vim
RUN yum -y install net-tools

#ADD aliyun-mirror.repo /etc/yum.repos.d/CentOS-Base.repo
#ADD aliyun-epel.repo /etc/yum.repos.d/epel.repo

#RUN yum install -y curl wget tar bzip2 unzip vim-enhanced passwd sudo yum-utils hostname net-tools rsync man && \
         yum install -y gcc gcc-c++ git make automake cmake patch logrotate python-devel libpng-devel libjpeg-devel && \
         yum install -y --enablerepo=epel pwgen python-pip && \
         yum clean all

#RUN pip install supervisor  # 安装进程管理工具
#ADD supervisord.conf /etc/supervisord.conf  # 添加进程管理工具的主配置文件到指定目录下，一般是/etc目录

RUN echo 'root:root' | chpasswd


EXPOSE 22
EXPOSE 8080

ENTRYPOINT ["/usr/bin/supervisord", "-n", "-c", "/etc/supervisord.conf"]
