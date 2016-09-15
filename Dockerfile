FROM ubuntu
MAINTAINER YOU NAME<your.name@cruk.cam.ac.uk
RUN apt-get update
RUN apt-get install -y samtools bwa wget unzip git make
WORKDIR /tmp
RUN wget http://www.bioinformatics.babraham.ac.uk/projects/fastqc/fastqc_v0.11.3.zip
RUN unzip fastqc_v0.11.3.zip
RUN chmod 755 FastQC/fastqc
RUN ln -s /tmp/FastQC/fastqc /usr/bin/fastqc
RUN git clone --recursive git://github.com/ekg/freebayes.git
WORKDIR freebayes
RUN make
RUN make install