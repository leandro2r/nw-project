FROM blacklabelops/virtualbox

WORKDIR /root

COPY . /root/nw

RUN yum install vixie-cron

RUN cd nw &&\
    make all &&\
    rm -rf /root/nw

CMD "nw start && tail -f /dev/null"
