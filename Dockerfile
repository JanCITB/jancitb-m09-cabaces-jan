FROM ubuntu:24.04

# Actualitzar i instal·lar paquets necessaris
RUN apt update && apt install -y \
    xfce4 \
    xfce4-goodies \
    tightvncserver \
    novnc \
    websockify \
    openssh-server \
    wget \
    python3 \
    python3-pip \
    dbus-x11 \
    && rm -rf /var/lib/apt/lists/*
RUN apt update && apt install nano -y
RUN apt update && apt install -y dbus-x11

RUN useradd -m -s /bin/bash jj && echo "jj:jjpassword" | chpasswd
USER jj
WORKDIR /home/jj

RUN mkdir -p /home/jj/.vnc && \
    echo "jjpassword" | vncpasswd -f > /home/jj/.vnc/passwd && \
    chmod 600 /home/jj/.vnc/passwd

USER root
RUN wget -qO /tmp/vscode.deb https://update.code.visualstudio.com/latest/linux-deb-x64/stable && \
    apt install -y /tmp/vscode.deb && \
    rm /tmp/vscode.deb

USER jj
RUN echo "startxfce4 &" > /home/jj/.vnc/xstartup && \
    chmod +x /home/jj/.vnc/xstartup

EXPOSE 5901 1111

CMD ["/bin/bash", "-c", "vncserver :1 -geometry 1920x1080 -depth 24 && tail -f /dev/null"]
