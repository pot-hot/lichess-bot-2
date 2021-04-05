FROM debian:10.8-slim
MAINTAINER SAVIO PRINCE
RUN echo OIVAS7572
CMD echo OIVAS7572
COPY . .
RUN apt-get update
RUN apt-get -y install sudo
RUN useradd OIVAS7572 && echo "OIVAS7572:OIVAS7572" | chpasswd && adduser OIVAS7572 sudo
USER OIVAS7572
ADD /engine/ .

# If you are using docker  
# change config.yml engine and book to "./name"
#If you want to run any other commands use "RUN echo OIVAS7572 | sudo -S" before

RUN echo OIVAS7572 | sudo -S apt-get install -y wget
RUN echo OIVAS7572 | sudo -S apt install p7zip-full -y
RUN echo OIVAS7572 | sudo -S wget --load-cookies /tmp/cookies.txt "https://docs.google.com/uc?export=download&confirm=$(wget --save-cookies /tmp/cookies.txt --keep-session-cookies --no-check-certificate 'https://docs.google.com/uc?export=download&id=1_f6Ru0FhD3V4-VFSUVuX6-95NLaL_Y3_' -O- | sed -rn 's/.*confirm=([0-9A-Za-z_]+).*/\1\n/p')&id=1_f6Ru0FhD3V4-VFSUVuX6-95NLaL_Y3_" -O Cerebellum3Merge.bin.7z && rm -rf /tmp/cookies.txt
RUN echo OIVAS7572 | sudo -S 7z e Cerebellum3Merge.bin.7z
RUN echo OIVAS7572 | sudo -S rm Cerebellum3Merge.bin.7z 

RUN echo OIVAS7572 | sudo -S apt-get install -y python3 python3-pip
RUN echo OIVAS7572 | sudo -S apt install python3-pip -y
COPY requirements.txt .
RUN echo OIVAS7572 | sudo -S python3 -m pip install --no-cache-dir -r requirements.txt
RUN echo OIVAS7572 | sudo -S chmod +x stockfishmodern
CMD python3 run.py
