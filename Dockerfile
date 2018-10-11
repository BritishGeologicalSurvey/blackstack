FROM tesseractshadow/tesseract4re

RUN apt update -y && \
  apt install poppler-utils ghostscript -y && \
  apt install parallel -y && \
  apt install python3 python3-pip python-tk -y && \
  apt install nodejs -y && \
  apt install imagemagick -y

# tk stuff wants these options for headless pyplot
COPY matplotlibrc /root/.config/matplotlib/matplotlibrc

COPY requirements.txt .
RUN pip3 install -r requirements.txt

RUN apt install -y npm
RUN npm install -g hocrjs

ENV PDF=/app/pdf
ENV PYTHONPATH=$PDF
WORKDIR $PDF

COPY *sh $PDF/
COPY *py $PDF/
COPY annotator $PDF/annotator
COPY config.py.env $PDF/config.py

COPY test/*.pdf $PDF/test/

# COPY test/*.jpg $PDF/test/

RUN mkdir out
WORKDIR $PDF

EXPOSE 5555

RUN chmod 775 $PDF/*.sh

ENTRYPOINT bash -c $PDF/run.sh
#CMD bash -c "sleep 10; cess.sh training test/WH897R_29453_000452.pdf; python3 $PDF/server.py"
#CMD ["./preprocess.sh", "training", "test/WH897R_29453_000452.pdf"]

