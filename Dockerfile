FROM centos

ENV LC_ALL=en_US.utf-8
ENV LANG=en_US.utf-8
#ADD plantuml.jar /opt/plantuml/
# latest: https://sourceforge.net/projects/plantuml/files/latest/download
RUN yum install -y epel-release && \
    yum update -y && \
    yum install -y graphviz java-1.8.0-openjdk python36 curl git && \
    ln -s /usr/bin/python3.6 /usr/bin/python && python -V && \
    curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py && python get-pip.py && \
    mkdir -p /opt/plantuml/ && \
    curl -L https://sourceforge.net/projects/plantuml/files/1.2020.3/plantuml.1.2020.3.jar/download -o /opt/plantuml/plantuml.jar
ADD plantuml /bin/
RUN chmod +x /bin/plantuml
RUN mkdir /js
COPY js/umlconvert.js /js/

#RUN yum -y install epel-release;
#RUN yum update -y;
#RUN yum install -y java-1.8.0-openjdk;
#RUN yum install -y graphviz;
#RUN yum install -y python36
#RUN pip3 install --upgrade pip; 
RUN pip install mkdocs-cinder; 
RUN pip install mkdocs-material;
RUN pip install mkdocs;
RUN pip install mkdocs-bootstrap; 
RUN pip install mkdocs-bootswatch; 
RUN pip install pymdown-extensions; 
RUN pip install plantuml-markdown;

WORKDIR /docs
#ENTRYPOINT ["mkdocs"]
