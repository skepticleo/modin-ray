FROM continuumio/miniconda3
WORKDIR /root
RUN conda install -c conda-forge psutil setproctitle
RUN pip install modin "ray==0.8.6" boto3==1.4.8 rpyc==4.1.5
COPY worker head ./
RUN chmod +x worker head
ENTRYPOINT /bin/bash
CMD head.sh
