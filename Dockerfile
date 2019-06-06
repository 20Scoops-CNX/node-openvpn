FROM alpine

RUN apk --no-cache --no-progress upgrade && \
    apk --no-cache --no-progress add bash curl ip6tables iptables openvpn nodejs nodejs-npm git openssh tar gzip ca-certificates \
                shadow tini && \
    addgroup -S vpn && \
    rm -rf /tmp/*

RUN npm install -g yarn@0.18.1

COPY ./vpn /vpn
RUN chmod 600 -R /vpn

CMD openvpn --config /vpn/vpn.ovpn || echo mypassword
